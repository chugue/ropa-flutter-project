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
      return "Email에 공백이 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "Email의 길이를 초과하였습니다.";
    } else if (value.length < 4) {
      return "Email에의 최소 길이는 4자입니다.";
    } else {
      return null;
    }
  };
}

Function validateNickName() {
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
