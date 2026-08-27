---
paths:
  - "**/.ssh/**"
  - "**/ssh/**"
  - "**/ssh_config"
  - "**/sshd_config"
---

## SSH Config

### Files

```yml
profiles/misc/ssh/:
  che.yml:  # ssh profile (host: config link), ssh/virt profile (virt-only key renders)
  root/_home/.ssh/:
    config:  # client config
  root/_home/.config/user-ssh-util/:
    config.yml:  # declares id_access + id_signing: type, publishTo, rotation period
  root/etc/zsh/zshenv.d/functions/:
    fn-ssh-test-git-connection:
  root-virt/_home/.ssh/:  # virt-only sandbox keypair renders (op://)
    id_access.ontoHost.tpl:
    id_access.pub.ontoHost.tpl:
    id_signing.ontoHost.tpl:
    id_signing.pub.ontoHost.tpl:
```

### Key Lifecycle

`user-ssh-util` owns generation, publishing and rotation. It reads
`~/.config/user-ssh-util/config.yml`, records reality in
`~/.local/share/user-ssh-util/state.yml`, and archives superseded keypairs under
`backups/` rather than deleting them.

- `$ user-ssh-util status` — what exists, where it is published, when it rotated
- `$ user-ssh-util sync --dry-run` — the plan, always run before the real thing
- `$ user-ssh-util sync --force-rotate-keys=id_signing` — rotate one key now

A keypair already on disk is adopted, never regenerated over. Usage type is
scoped per platform (gitlab `auth`/`signing`, github
`authentication`/`signing`), never the CLI defaults.

### Documentation

`$ man`:

- `ssh`: client invocation, options, escapes, exit status
- `ssh_config`: client config keys, Host/Match, includes, precedence
- `ssh-keygen`: key gen/convert, fingerprints, signing, certs, moduli
- `ssh-agent`: agent protocol, lifetime, env, forwarding
- `ssh-add`: load/list/remove keys, lifetime, confirmation
- `scp`: copy over ssh, flags, remote paths
- `sftp`: interactive/batch file transfer, commands
- `sshd_config`: server config keys (reference for matching client opts)
- `moduli`: DH group format for kexalgorithms

#### Algorithms

Acceptable algorithm names for `Ciphers`, `MACs`, `KexAlgorithms`,
`HostKeyAlgorithms`, `PubkeyAcceptedAlgorithms`, `CASignatureAlgorithms`:

- `$ ssh -Q cipher` / `-Q mac` / `-Q kex` / `-Q key` / `-Q sig`
- `$ man ssh_config`: per-keyword DEFAULT lists and full sets
