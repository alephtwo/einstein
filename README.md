# Einstein
Einstein is a web application that allows clients to report occurrences of
behaviors, which can be read and analyzed by staff at a behavioral health
institution.

## Users
"Users" are defined as individuals that have access to client reports. They are
able to create client accounts, assign behaviors to clients, and view client
reports. Users log in using `/staff`.

## Clients
Clients drive the functionality of Einstein. When a user creates an account for
a client, that account is given a password and a unique numeric ID. Clients use
these IDs to sign in, which allows them the ability to submit reports for
their assigned behaviors.

## Reports
Reports include a timestamp (when the report is sent), the behavior being
reported, and a number of occurrences.

## HIPAA Compliance
Einstein collects minimal information (usually just a last name), so there is
very minimal risk of a serious leak of PHI occurring. What little data Einstein
**does** store is encrypted at rest in the database. In order to be fully
compliant, it is imperative to minimize the number of users that have access
to the system. Any setup should also have a verified certificate for HTTPS as
well.

## Requirements
* Ruby 2.2.1
* Rails 4.2.x
