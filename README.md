# SRE Spring 2020 Student Repo - Karson Mahan

* **[Labs](./Labs/README.md)**
* **[Projects](./Projects/README.md)**



## Projects & Lab Workflow

Project code should be compartmentalized to a subdirectory with an appropriate name located in the top level of the repository (Project One = P1, Lab One = L1). This project should **NOT** be polluted with non-code materials (presentations, etc). In general, copy the sub-directories containing the skeleton code and any associated files into the project directory (ex: P1) and make that the initial commit on the new branch.

**EVERY** project subdirectory must include a `README.md` describing your work and any special notes necessary for your work to be evaluated. This README should **NOT** be a copy paste of the provided assignment `README.md` file for the respective SRE-S20 project. Rather, this README fulfills the supplementary report/documentation required of every submitted lab/project, unless explicitly stated. The majority of reports will be in IEEE format using the provided LaTeX format.



### Repository Structure

```txt
.
├── Labs
│   ├── L1
│   │   ├── img
│   │   ├── src
|   |   ...
│   │   └── README.md
|   ...
│   └── Ln
│   │   ├── img
│   │   ├── src
|   |   ...
│   │   └── README.md
|   └── README.md
├── Projects
│   ├── P1
│   │   ├── img
│   │   ├── src
|   |   ...
│   │   └── README.md
|   ...
│   └── Pn
│   │   ├── img
│   │   ├── src
|   |   ...
│   │   └── README.md
|   └── README.md
|   ...
└── README.md
```



### (1) Starting Work

For each project/lab, create a branch **off of master** -- run `git status` or `git branch` to make sure your current branch is master. If you are not on master, simply run `git checkout master` to move to it. To create the new lab/project branch, run `git checkout -b BRANCH_NAME`. Name branches using the following convention:

* Labs
    * L1, L2, etc.
* Projects
    * P1, P2, etc.

After your first commit on this branch, push to remote via `git push -u origin BRANCH_NAME` and open a pull request comparing the branch to the master base branch. Note that your pull request is the clear indication to your instructors that you have begun work on a given task!

An example pull request name for Lab 0 for Parker Adams would be `L0 - PA`. Please include your initials in this pull request! After creating the pull request, add `ASRL/sre-instructors` to the `Reviewers` tab and yourself to the `Assignees` tab (both on the right).



### (2) Getting Help

Ping the instructors at `@ASRL/sre-instructors` via an Issue, the Pull Request, on [Keybase](https://keybase.io/), or through email to notify them that you need help with your work. Use this repository for personalized help. Use the [class repository](https://github.com/ASRL/SRE-S20) for more generalized questions/concerns.



### (3) Submitting Work

When you are ready to submit, ping the instructors that your work is complete. The instructors will review the pull request and take one of two actions:

* Approval
    * Your work is considered complete and graded -- you may safely merge via the green `merge` button using a "merge commit" method (should be the default)
        * Once done, run `git checkout master` and `git pull --rebase` to pull the new commits on the remote master into your local master.
* Request Changes
    * Your instructor may ask for you to correct or improve some portion of your work. Make these changes, commit/push them, and ping instructors again. This process will continue until work receives final approval.



## Git LFS

The [class repository](https://github.com/ASRL/SRE-S20) is [Git LFS](https://git-lfs.github.com/) enabled. Students are required to make use of this tool as well. Recall from your Git training that Git LFS is used to track **anything** that isn't text! Follow these guidelines:

* LFS track non-text files
    * BIN, IDB, I64, JPG, PNG, PDF, PPTX, DOCX, etc.
* With rare exceptions, track LFS files from the repo's root (top level)
    * `git lfs track "\*.SOME_EXTENSION"`
    * `git add .gitattributes`
    * `git commit -m "LFS tracking .SOME_EXTENSION files"`
    * Then proceed to add/commit/push the non-text file
* WARNING
    * LFS Tracking is case sensitive (e.g. a "\*.png" rule **WILL NOT** apply to a "\*.PNG" file)



### Git Tips

* [Git Checkout](https://www.atlassian.com/git/tutorials/using-branches/git-checkout/)
    - Git provides powerful branching features -- make use of them! You can/should have multiple branches out when working on more than one lab/project.
    - When your working directory is clean (no pending changes), you may easily move back and forth between branches. All it takes is: `git checkout BRANCH_NAME`.
        - NOTE: **Always** run `git checkout master` to move back to your local master prior to creating a new branch!
* [Git Stash](https://www.atlassian.com/git/tutorials/git-stash/)
    * Problems
        * Git won't let you `checkout` another branch when you have work-in-progress (WIP, i.e. uncommitted changes to tracked files)
        * Git won't allow you to `pull --rebase` with work-in-progress
    * Solution
        * Run `git stash` to "stash" your current branch's WIP material on a stack (literally saves your working directory state)
        * Change to the branch you want to work on via `git checkout BRANCH_NAME`
        * When done, checkout your original branch and run `git stash pop` to put your WIP back into your working directory!



## Miscellaneous Notes

* Use coherent/concise commit messages
* DO NOT delete project branches