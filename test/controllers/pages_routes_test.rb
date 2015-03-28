class PagesRoutesTest < ActionController::TestCase

  test "should route to cat page" do
    assert_routing '/pages/cat', { controller: "pages", action: "page", page: "cat" }
  end

end