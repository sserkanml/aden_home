import 'package:aden/core/constant/service_constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  SupabaseClient supabaseClient =
      SupabaseClient(ServiceConstant.PROJECTURL, ServiceConstant.APIKEY);
}
