library(usethis)

#renombrar rama default de master a main
usethis::git_default_branch_rename()

# Inicializar repositorio remoto.
usethis::use_github()
