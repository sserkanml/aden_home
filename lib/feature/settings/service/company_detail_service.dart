import 'dart:convert';

import 'package:aden/core/service/dependecy_injenction.dart';
import 'package:aden/core/service/supabase_service.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class CompanyIndustryModel {
  final int industry_id;
  final String name;
 static int selectedIndustry = 0;
  CompanyIndustryModel({
    required this.industry_id,
    required this.name,
  });

  CompanyIndustryModel copyWith({
    int? industry_id,
    String? name,
  }) {
    return CompanyIndustryModel(
      industry_id: industry_id ?? this.industry_id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'industry_id': industry_id,
      'name': name,
    };
  }

  factory CompanyIndustryModel.fromMap(Map<String, dynamic> map) {
    return CompanyIndustryModel(
      industry_id: map['industry_id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyIndustryModel.fromJson(String source) =>
      CompanyIndustryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CompanyIndustryModel(industry_id: $industry_id, name: $name)';

  @override
  bool operator ==(covariant CompanyIndustryModel other) {
    if (identical(this, other)) return true;

    return other.industry_id == industry_id && other.name == name;
  }

  @override
  int get hashCode => industry_id.hashCode ^ name.hashCode;
}

class CompanyIndustryService {
  static Future<List<CompanyIndustryModel>?>? getIndustryService() async {
    try {
      final response = await DependecyService.getIt
          .get<SupabaseService>()
          .supabaseClient
          .from("industry")
          .select()
          .order('name', ascending: true);
      List<CompanyIndustryModel> data = [];
      response.forEach((element) {
        data.add(CompanyIndustryModel(
            industry_id: element['industry_id'], name: element['name']));
      });

      return data;
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }
}
