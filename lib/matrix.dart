enum Matrix {
  urgentImportant("Urgent, Important"),
  notUrgentImportant("Not Urgent, Important"),
  urgentNotImportant("Urgent, Not Important"),
  notUrgentNotImportant("Not Urgent, Not Important");

  final String title;
  const Matrix(this.title);
}