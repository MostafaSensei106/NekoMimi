// abstract class LoveMeState {
//   final String answer;
//   final List<Map<String, String>> networkDetails;
//   final bool isLoading; // Add this line
//
//   LoveMeState(this.answer, this.networkDetails, {this.isLoading = false}); // Update constructor
// }
//
// class InitialState extends LoveMeState {
//   InitialState() : super('', [], isLoading: false);
// }
//
// class YesState extends LoveMeState {
//   YesState() : super('نعم ', [], isLoading: false);
// }
//
// class NoState extends LoveMeState {
//   NoState(List<Map<String, String>> networkDetails) : super('لا ', networkDetails, isLoading: false);
// }
//
// class ErrorState extends LoveMeState {
//   ErrorState() : super('حدث خطأ', [], isLoading: false);
// }
//
// class LoadingState extends LoveMeState {
//   LoadingState() : super('', [], isLoading: true);
// }