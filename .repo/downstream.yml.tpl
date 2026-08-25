##[>] 🤖
downstream:
  - uri: gitlab.com/konradodwrot/cross-repo/prose/assets
    type: gitRepository
    versionEnvVar: PROSE_ASSETS_REF
    version: {{ env.Getenv "PROSE_ASSETS_REF" }}
##[<] 🤖
