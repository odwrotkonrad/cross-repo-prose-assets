## Tests

Asked for tests: unit tests, unless told otherwise.

- Unit: a software deliverable (function, class, command, subcommand).
- Process: a running instance of a program, as in OS nomenclature.
- External interface: anything outside the process a unit can talk to (services, filesystem, db, OS operations).

External interface use and assertion scope decide the test type.

## Test Types

- **Unit**: scoped to the deliverable, no external interfaces.
- **Integration**: scoped to the deliverable, with direct external interfaces.
- **E2E**: assertions scoped beyond the deliverable, with external interfaces.
