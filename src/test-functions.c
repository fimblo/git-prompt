#include <stdio.h>
#include <git2.h>
#include "git-status.h"

//int main(int argc, char *argv[]) {
int main(void) {
  git_libgit2_init();
  struct RepoContext context;
  initializeRepoContext(&context);
  populateRepoContext(&context, ".");
  getRepoStatusList(&context);

  struct RepoStatus status;
  initializeRepoStatus(&status);
  getRepoStatus(context.status_list, &status);

  getRepoDivergence(&context, &status);


  printf("Repo.name %s\n",        getRepoName(&context));
  printf("Repo.branch.name %s\n", getBranchName(&context));

  printf("Repo.status %s\n",      state_names[status.status_repo]);
  printf("Repo.ahead %d\n",       status.ahead);
  printf("Repo.behind %d\n",      status.behind);


  printf("Staged.status %s\n",    state_names[status.status_staged]);
  printf("Staged.num %d\n",       status.staged_changes_num);
  printf("Unstaged.status %s\n",  state_names[status.status_unstaged]);
  printf("Unstaged.num %d\n",     status.unstaged_changes_num);

  printf("Conflict.num %d\n",     status.conflict_num);

  
  git_libgit2_shutdown();
}
