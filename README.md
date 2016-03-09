# Einstein
Einstein is a web application that allows clients to report occurrences of
behaviors, which can be read and analyzed by staff at a behavioral health
institution.

Einstein has been designed with minimalism and performance in mind. The goal
is to make the process of tracking client reporting easy and fast for all
involved parties, which in turn makes it more likely that reports will both
actually be filed and be filed correctly.

## Users
"Users" are defined as individuals that have access to client reports. They are
able to create client accounts, assign behaviors to clients, and view client
reports.

Users log in using `/staff`.

There are no default users; any users must be created when bringing up an
instance. Thankfully, this is relatively simple to do from the rails console:

```
$ rails c
$ User.create(email: "bob@example.com", password: "helloWorld", password_confirmation: "helloWorld")
```

## Clients
Clients drive the functionality of Einstein. When a user creates an account for
a client, that account is given a password and a unique numeric ID. Clients use
these IDs to sign in, which allows them the ability to submit reports for
their assigned behaviors.

Clients log in using the default path `/`.

There are no limits on password complexity with clients. This is to ensure that
the password is easy to remember. Since clients are not able to do anything dangerous
outside of creating behavior reports, a security breach here does not constitute
a serious vulnerability. The emphasis has been placed on usability and user-friendliness.

## Reports
Reports include a timestamp (when the report is sent), the behavior being
reported, and a number of occurrences.

## Data Export
Data that is collected by Einstein can be exported to Excel format for storage
and ease of sharing.

## HIPAA Compliance
Einstein collects minimal information (usually just a last name), so there is
very minimal risk of a serious leak of PHI occurring. What little data Einstein
**does** store is encrypted at rest in the database. In order to be fully
compliant, it is imperative to minimize the number of users that have access
to the system. Any setup should also have a verified certificate for HTTPS as
well.

## Requirements
* Ruby 2.2.x or greater
* PostgreSQL

## TODO
There are a few pieces of functionality on the roadmap:
* Access roles
* Comments in behavior reports
* Configurability - change institution name, logo, etc.
* Data visualization - charts to track the reporting process
* ReCAPTCHA on client login
* Dedicated Open Source licenses page
