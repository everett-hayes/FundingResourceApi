User.create!(email: 'admin@grinnell.edu', password: 'asdfasdf', password_confirmation: 'asdfasdf', is_admin: true)
User.create!(email: 'hayeseve@grinnell.edu', password: 'asdfasdf', password_confirmation: 'asdfasdf', is_admin: false)
User.create!(email: 'izan@grinnell.edu', password: 'Spiderman1', password_confirmation: 'Spiderman1', is_admin: false)

Resource.create!(source: 'CLS',
    funding_name: 'Service & Social Innovation Grant',
    description: 'The Ragnar Thorisson \'11 Service and Social Innovation Grant is designed to support collaborative service and social justice projects in our local Grinnell or Iowa community. ​​​​​​​First, second, third, and fourth year students may apply for funding to offset expenses associated with projects that address locally identified service or social justice challenges.',
    amount: '3000',
    contact_person: 'Keira Wilson',
    web: 'https://grinco.sharepoint.com/sites/ServiceAndSocialInnovation/SitePages/Funding.aspx',
    eligible: '1-4th year students',
    deadline: 'Rolling',
    is_approved: true)

Resource.create!(source: 'Wilson Center',
    funding_name: 'Wilson Funding',
    description: 'The Wilson Center is open to sponsoring events, conferences, and other relevant off-campus opportunities that you believe strengthen your innovation and leadership skills, knowledge, and critical thinking ability. We offer funding for some experiences that make an impact and align with our mission.',
    amount: 'Flexible',
    contact_person: 'Monty Roper & Robert Ludwig',
    web: 'https://www.grinnell.edu/academics/centers-programs/wilson/funding',
    eligible: '1-4th year students',
    deadline: 'Rolling',
    is_approved: true)

Resource.create!(source: 'CLS',
    funding_name: 'Summer Internship Funding Grants',
    description: 'Current first-, second-, and third-year students may apply for funding to offset the costs of food, transportation, and housing for an 8- to 10-week, full-time unpaid or underpaid internship. The internship must be secured at the time of application.',
    amount: 'Flexible',
    contact_person: 'Diego Rodriguez',
    web: 'https://grinco.sharepoint.com/sites/OAS/CLS/Internship/SitePages/Summer%20Funding.aspx',
    eligible: '1st-3rd year students',
    deadline: 'Rolling',
    is_approved: false)

