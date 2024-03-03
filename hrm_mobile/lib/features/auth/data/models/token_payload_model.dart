import 'package:hrm_mobile/features/auth/domain/entities/token_payload_entity.dart';

class TokenPayLoadModel extends TokenPayLoadEntity {
  const TokenPayLoadModel({required super.userId});
  
  @override
  List<Object?> get props => [userId];
}
