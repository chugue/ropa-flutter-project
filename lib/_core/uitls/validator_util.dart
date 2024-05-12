import 'package:validators/validators.dart';

Function validateNickName() {
  return (String? value) {
    if (value!.isEmpty) {
      return "유저네임에 들어갈 수 없습니다.";
    } else if (!isAlphanumeric(value)) {
      return "유저네임에 한글이나 특수 문자가 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "유저네임의 길이를 초과하였습니다.";
    } else if (value.length < 3) {
      return "유저네임의 최소 길이는 3자입니다.";
    } else {
      return null;
    }
  };
}

Function validatePassword() {
  return (String? value) {
    if (value!.isEmpty) {
      return "패스워드 공백이 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "패스워드의 길이를 초과하였습니다.";
    } else if (value.length < 4) {
      return "패스워드의 최소 길이는 4자입니다.";
    } else {
      return null;
    }
  };
}

Function validateEmail() {
  return (String? value) {
    if (value!.isEmpty) {
      return "이메일은 공백이 들어갈 수 없습니다.";
    } else if (!isEmail(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}

Function validateTitle() {
  return (String? value) {
    if (value!.isEmpty) {
      return "제목은 공백이 들어갈 수 없습니다.";
    } else if (value.length > 30) {
      return "제목의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}

String? Function(String? value) validateContent() {
  return (String? value) {
    if (value!.isEmpty) {
      return "내용은 공백이 들어갈 수 없습니다.";
    } else if (value.length > 500) {
      return "내용의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}

Function validateApplyHeight() {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return '숫자을 입력해주세요'; // "Please enter a value"
    }
    final number = double.tryParse(value);
    if (number == null) {
      return '숫자만 입력해주세요'; // "Please enter a number"
    }
    if (number < 50 || number > 300) {
      return '키는 50cm에서 300cm 사이여야 합니다'; // "Height must be between 50cm and 300cm"
    }
    return null;
  };
}

Function validateInstagramLink() {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return '링크를 입력해주세요'; // "Please enter a link"
    }
    // Optionally, add more complex validation to check if it's a valid URL
    return null;
  };
}

Function validateApplyWeight() {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return '숫자를 입력해주세요';
    }
    final number = double.tryParse(value);
    if (number == null) {
      return '숫자만 입력해주세요';
    }
    if (number < 10 || number > 200) {
      return '체중은 10kg에서 200kg 사이여야 합니다';
    }
    return null;
  };
}

Function validateJob() {
  return (String? value) {
    if (value == null || value.isEmpty) {
      return '직업을 입력해주세요'; // "Please enter a job"
    }
    // Check if the value is one of the allowed options
    if (value != '직장인' && value != '대학생') {
      return '직업은 직장인 또는 대학생 중 하나여야 합니다'; // "Job must be either 직장인 or 대학생"
    }
    return null;
  };
}

//
// Function validateApplyWeight() {
//   return (String? value) {
//     if (value!.isEmpty) {
//       return "내용은 공백이 들어갈 수 없습니다.";
//     } else if (value.length > 500) {
//       return "내용의 길이를 초과하였습니다.";
//     } else {
//       return null;
//     }
//   };
// }
