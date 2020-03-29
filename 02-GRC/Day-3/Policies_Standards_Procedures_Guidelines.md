# Policys
### Description
	Top Level, Very Generalized, Stated Goal
### Approvers
	Approved Executive Leadership (Only)
### Reviews/Changes
	Reviewed Yearly
	Changes **At Most** yearly, Normally/Ideally once every few years
### Requires Change Control?
	YES
### Example
	<Authorized Use Policy>
	- We will not allow unauthorized administrative access to systems

# Standards
### Description
	Mid-Level, Slightly more detailed, approved **methodologies** for achieving the goal.
### Approvers
	Approved by Directors, (Senior-)Managers,
	Usually Written by Managers - (Technical manager/Technical Lead)
### Reviews/Changes
	Reviewed Every 6 months. Can Be Reviewed Yearly as part of policy review.
	Changes and approvals can be performed quicker because you don't have to engage C-Level execs. Person approving the standard usually has knowledge of some of the technical details in the standard.
### Requires Change Control?
	YES
### Example
	In order to achieve the goals of <Policy Name Here (Authorized Use Policy)> We will follow industry best practices in alignment with guidance from NIST 800-53, CIS Level 1 Standard, PCI-DSS v3.2

# Procedure
### Description
	Step-By-Step guide of how we do the work to achieve the requirements stated in the Standards Document.
### Approvers
	Approved By Technical Managers OR HR Managers (Team Leads)
	Probably Written by Engineers
### Reviews/Changes
	Reviewed Quarterly.
	Changes when the Procedure Owner, usually a manager/lead, sees fit.
### Requires Change Control?
	YES
### Example
	PURPOSE:
	In order to meet the requirements stated in <standard A> and the goals of  
	SCOPE:
	This applies to (Windows Domain Controllers OR Linux Systems)
	STATEMENT:
	We will Perform Action A based on Guideline A
	We will perform Action B based on Guidelin A
	We will perform Action B based on Guidelin A
	

# Guidelines
### Description
	Low-level, informal, extremely detailed, exact implementation of how we are achieving a goal in alignment with procedures, standards, and policy.
### Approvers
	N/A, this is a reference item and 'living document' for your engineers to reference and make sure everyone is on the same page about details regarding specific implementation of controls.
### Reviews/Changes
	Reviewed every time it is used by the person reading it. Can be changed as needed to fit the current state of security. (new vulnerability released yesterday that makes a previous configuration insecure? here is where we update that configuration so that we can react quickly without waiting on approvals.)
	This document can be modified by anyone who is an administrator of the system

### Requires Change Control?
	Document does not require change control.
### Example
	Domain Controllers to log into:
	WindowsDCA.contoso.local, WindowsDCB.contoso.local, WindowsDCC.contoso.local, and WindowsDCD.contoso.local. 
	Run `<example command> Disable-Root -enforce ` to disable Root Access
	
# Exception (to Policy)
	We are knowingly not following a policy
    This needs to be approved by senior managed (Executives, VPs)
	Any Exception that is created needs a time range specified. 
	I.e. "This Exception is applicable for X Days, or X Months, (at most 1 year)."
	Exception is reviewed at the end of the applicable timeframe to determine if the exception is still needed.

# Finding
	We identified something during a review/audit that does not appear to be following policy/standards/procedures.
	(Requires further review to determine if this is something that needs an exception or not)

# Non-Conformity (Standards/Procedures)
	It Follows Policy 
	But does not follow Standards/procedures
	This is documented so that policy/Standards/Procedures can be updated during reviews
