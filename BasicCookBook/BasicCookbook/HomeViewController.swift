import UIKit

// MARK: - UIViewController

class HomeViewController: UITableViewController {
  let transition = PopAnimator()
  override var prefersStatusBarHidden: Bool {
    return true
  }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension HomeViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Recipe.all().count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "RecipeTableViewCell",
      for: indexPath
    ) as! RecipeTableViewCell
    
    cell.recipe = Recipe.all()[indexPath.row]
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: "showDetails", sender: Recipe.all()[indexPath.row])
  }
}

// MARK: - Prepare for Segue

extension HomeViewController {
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if
      let detailsViewController = segue.destination as? DetailsViewController,
      let recipe = sender as? Recipe {
        detailsViewController.transitioningDelegate = self
        detailsViewController.recipe = recipe
    }
  }
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return transition
  }
  
  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return nil
  }
}
