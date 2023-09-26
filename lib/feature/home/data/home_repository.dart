class HomeRepository {
  int selectedTab = 0;

  void onSelectTab(int index) {
    if (selectedTab == index) return;
    selectedTab = index;
  }
}
