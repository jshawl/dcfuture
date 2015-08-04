User.destroy_all
Comment.destroy_all
Post.destroy_all

admin = User.create(username: "DCFuture Admin", password_digest: "p30p!epoWer51")
# dc = Section.create(name: "DC")
# issues = Section.create(name: "Issues")
# elections = Section.create(name: "Elections")
# government = Section.create(name: "Government")
# intro = Post.create(title: "Welcome to DCFuture", summary: "Why This Blog Exists", body: "Washington, DC is a city full of concurrent, and often conflicting, extremes. Extreme wealth and extreme poverty. Disenfranchisement and tremendous power. Growth and displacement. Trendiness and tradition. But regardless of where in the city we live, every one of the more than half a million of us who live here has another word for the District: home.
#
# Whether our intended stay in the nation’s capital is temporary or permanent, all of us living in DC have a stake in the well-being of the unique city we call home. Yet all too often, the policy-making process fails to adequate reflect the sum of our values, as the voices of everyday DC residents tend to be drowned out by well-heeled professional lobbyists and the business interests they represent.
#
# It’s not as if we suffer from a shortage of valuable voices. This is one of the most educated and politically savvy cities out there – so many of our nation’s policy experts, advocacy specialists and leading political thinkers reside within our borders. If there’s an issue, somebody in DC wants to address it, somebody has an innovative and socially-beneficial solution in hand, and somebody knows how to build a campaign to enact that solution into law. We have the capacity here to do so much more, to transform our government from business as usual to one that leads by example. But we need to ensure those solutions are being lifted up, by citizens from Columbia Heights to Congress Heights, and echoing throughout the rarefied marble halls of power in the John A. Wilson Building, a deafening roar that makes it easy for our elected officials to do the right thing.
#
# DCFuture.com is the virtual town square where DC residents can learn about our unique city, think big about its future, plug into the hot and emerging issue and political campaigns of the moment, and even start their own campaigns.", user: admin, section: "dc")

Post.create(title: "test test", summary: "I like pie", body: "More test", user: admin, section: "issues")
