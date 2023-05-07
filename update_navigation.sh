#!/bin/bash

NAVIGATION=$(cat <<'END_HEREDOC'
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
  <!-- ... -->
  <li class="nav-item">
    <a class="nav-link" href="dashboard.html">
      <i class="fas fa-fw fa-tachometer-alt"></i>
      <span>Dashboard</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="income.html">
      <i class="fas fa-fw fa-coins"></i>
      <span>Income</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="expenses.html">
      <i class="fas fa-fw fa-credit-card"></i>
      <span>Expenses</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="accounts.html">
      <i class="fas fa-fw fa-university"></i>
      <span>Accounts</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="budgets.html">
      <i class="fas fa-fw fa-chart-pie"></i>
      <span>Budgets</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="savings-goals.html">
      <i class="fas fa-fw fa-piggy-bank"></i>
      <span>Savings Goals</span>
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="settings.html">
      <i class="fas fa-fw fa-cogs"></i>
      <span>Settings</span>
    </a>
  </li>
  <!-- ... -->
</ul>
END_HEREDOC
)

FILES="dashboard.html income.html expenses.html accounts.html budgets.html savings-goals.html settings.html"

for file in $FILES; do
  echo "Updating navigation in $file"
  awk -v nav="$NAVIGATION" '
  /<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">/,/<\/ul>/ {
    if (!printed) {
      print nav
      printed = 1
    }
    next
  }
  { print }
  ' "$file" > "$file.tmp" && mv "$file.tmp" "$file"
done
