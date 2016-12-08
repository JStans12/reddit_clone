class HomeController < DashboardController
  def index
    @posts = Post.top_posts("/r/all/")
  end
end
