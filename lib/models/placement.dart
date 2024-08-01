class Placement {
  final String name;
  final String photoUrl;
  final String jobRole;
  final String companyName;

  Placement({
    required this.name,
    required this.photoUrl,
    required this.jobRole,
    required this.companyName,
  });

  factory Placement.fromJson(Map<String, dynamic> json) {
    return Placement(
      name: '${json['name']['first']} ${json['name']['last']}',
      photoUrl: json['picture']['medium'],
      jobRole: getRandomJobRole(),
      companyName: getRandomCompanyName(),
    );
  }
}

// Random job role generator function
String getRandomJobRole() {
  List<String> jobRoles = [
    'Web Developer',
    'Cloud Support Associate',
    'Software Developer',
    '.Net Developer',
    'QA Lead',
    'System Intern',
    'Software Engineer',
    'Python Developer',
    'Software Tester',
    'Junior Software Engineer',
    'Junior PHP Developer',
    'Frontend Developer',
    'MERN Stack Developer',
    'Flutter Developer',
    'React JS Developer',
    'Process Associate'
    // Add more roles as needed
  ];
  jobRoles.shuffle();
  return jobRoles.first;
}

String getRandomCompanyName() {
  List<String> companyNames = [
    'F9 Infotech, Kochi',
    'Town Contacts Technologies Pvt Ltd, Bangalore',
    'Astrins Technologies, Kochi',
    'Encxl Business Solutions Pvt Ltd, Haripad',
    'Cleareye ai, Technopark, Trivandrum',
    'KRAN Consulting Pvt Ltd, Trivandrum',
    'Access Solutions, Chennai',
    'Calmove Technologies Pvt Ltd, Trivandrum',
    'Whitesoft Ads & IT Support, Kakkanad, Kochi',
    'Vision Group Retail Technologies private limited, Nagercoil',
    'Srishti Innovative, Trivandrum',
    'Tanish Software Services, Punjab',
    'Travidux Technologies, Thrissur',
    'Traveluxis, Kochi',
    'Sodisys, Technopark, Trivandrum'
  ];
  companyNames.shuffle();
  return companyNames.first;
}
