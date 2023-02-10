# EchoLog

Welcome to the EchoLog repo!

## How to Turn Tickets Like a Pro

1. Clone this repo

    `git clone git@github.com:12yanogden/EchoLog.git`

2. Checkout dev. All branches will be merged with dev before dev is merged with main

    `git checkout dev`

3. Get a ticket. Message Ryan if you don't have a ticket assigned to you.
4. Create a branch on GitHub
   
   If the ticket is something like "Add colors", the branch should have a name that matches such as "add-colors".

   Creating the branch on GitHub first instead of locally will solve any upstream issues.

5. Add a link to the branch to the ticket's description. This will inform everyone else on the team what you're working on.

6. Fetch the branch
   
   `git fetch`

7. Checkout the branch

    `git checkout [branch_name]`

8. Work the ticket, commit, and push
9. When ready, make a pull request to merge the ticket's branch into dev.
10. Add a link to the pull request to the ticket's description. Move the ticket into Review.
11. If your code passes review, it will be merged into dev. If not, comments will be left in the pull request that highlight issues. Work with the reviewer to implement necessary fixes and push the ticket through.
12. Congrats! You just completed a ticket! Treat yourself to something sweet and get ready to do it all again 😄

If you have issues with any of the steps above, please reach out to Megan or Ryan help.