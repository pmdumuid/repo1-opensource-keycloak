## Summary

Request to update an application in Iron Bank.

Version: (State the version you would like the application updated to)

## Tasks

Contributor:
- [ ] Update `Dockerfile`, `hardening_manifest.yaml` and adhere to Iron Bank [requirements](https://repo1.dso.mil/dsop/dccscr/-/tree/master/Hardening)
- [ ] Ensure container builds successfully in the Iron Bank pipeline
- [ ] Provide justifications for findings in the [VAT](https://vat.dso.mil) ([docs](https://repo1.dso.mil/dsop/dccscr/-/blob/master/pre-approval/vat.md))
- [ ] Open a Merge Request from your branch to `development`
- [ ] Apply the ~"Approval" label to this issue and wait for feedback

Iron Bank:
- [ ] Merge contributor branch to `development`
- [ ] Review findings and justifications
- [ ] Send approval request to Authorizing Official
- [ ] Merge `development` to `master` and close issue after approval from Authorizing Official

> Note: If the above approval process is rejected for any reason, the `Approval` label will be removed and the issue will be sent back to `Open`. Any comments will be listed in this issue for you to address. Once they have been addressed, you **must** re-add the `Approval` label.

## Questions?

Contact the Iron Bank team by commenting on this issue with your questions or concerns. If you do not receive a response, add `/cc @ironbank-notifications/onboarding`.

Additionally, Iron Bank hosts an [AMA](https://www.zoomgov.com/meeting/register/vJIsf-ytpz8qHSN_JW8Hl9Qf0AZZXSCSmfo) working session every Wednesday from 1630-1730EST to answer questions.







/label ~"Container::Update"
