import 'package:cfc_main/domain/model/opportunity/all_opportunity_model.dart';
import 'package:dartz/dartz.dart';
import 'package:cfc_main/domain/model/opportunity/OpportunityDetails.dart';
import '../model/opportunity/Attachment.dart';

abstract class OpportunityInterFace{
  Future<Either<dynamic,AllOpportunityModel>> allOpportunity();
  Future<Either<dynamic,AllOpportunityModel>> myOpportunity();
  Future<Either<dynamic,List<Attachment>>> myOpportunityAttachment(int id);
  Future<Either<dynamic,OpportunityDetails>> myOpportunityDetails(int id);
}