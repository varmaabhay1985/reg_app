//Declaration of enum and resolving the name with Map

enum Gender { Male, Female }

enum Education { PG, Graduate, HD, SSC }

const Map<Education, String> Edu = {
  Education.PG: 'Post Graduate',
  Education.Graduate: 'Graduate',
  Education.HD: "HSC/Diploma",
  Education.SSC: "SSC"
};
enum Places { Maharashtra, Gujarat, Karnataka, MP, Delhi, Others }

const Map<Places, String> states = {
  Places.Maharashtra: 'Maharashtra',
  Places.Gujarat: 'Gujarat',
  Places.Karnataka: 'Karnataka',
  Places.MP: 'Madhya Pradesh',
  Places.Delhi: 'Delhi',
  Places.Others: 'Others'
};
