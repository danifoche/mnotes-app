//? validate the given field, used for forms
String? validateField(String? value, String? fieldName) {

  //? if the fieldname is not given then dont specify it in the error message
  fieldName = fieldName ?? "";

  if(value == null || value.isEmpty) {
    return "Il campo $fieldName è obbligatorio";
  }

  return null;
}