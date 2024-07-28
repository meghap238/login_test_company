abstract class UserEvent{
 const UserEvent();
}
class SubmitEvent extends UserEvent{
final String? email;
final String? password;
const SubmitEvent({required this.email, required this.password});
}
class GetDataEvent extends UserEvent{
 const GetDataEvent();
}