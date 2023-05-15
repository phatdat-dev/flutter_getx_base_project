import 'dart:convert';
import 'dart:math';

import 'package:flutter/widgets.dart';

const googleJsonRaw = '''
[
    {
        "iconHtml": "<i class='material-icons md-36'>10k</i>",
        "iconName": "ten_k",
        "iconCode": "0xe000"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>10mp</i>",
        "iconName": "ten_mp",
        "iconCode": "0xe001"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>11mp</i>",
        "iconName": "eleven_mp",
        "iconCode": "0xe002"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>123</i>",
        "iconName": "onetwothree",
        "iconCode": "0xf04b5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>12mp</i>",
        "iconName": "twelve_mp",
        "iconCode": "0xe003"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>13mp</i>",
        "iconName": "thirteen_mp",
        "iconCode": "0xe004"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>14mp</i>",
        "iconName": "fourteen_mp",
        "iconCode": "0xe005"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>15mp</i>",
        "iconName": "fifteen_mp",
        "iconCode": "0xe006"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>16mp</i>",
        "iconName": "sixteen_mp",
        "iconCode": "0xe007"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>17mp</i>",
        "iconName": "seventeen_mp",
        "iconCode": "0xe008"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>18_up_rating</i>",
        "iconName": "eighteen_up_rating",
        "iconCode": "0xf0784"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>18mp</i>",
        "iconName": "eighteen_mp",
        "iconCode": "0xe009"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>19mp</i>",
        "iconName": "nineteen_mp",
        "iconCode": "0xe00a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>1k</i>",
        "iconName": "one_k",
        "iconCode": "0xe00b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>1k_plus</i>",
        "iconName": "one_k_plus",
        "iconCode": "0xe00c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>1x_mobiledata</i>",
        "iconName": "one_x_mobiledata",
        "iconCode": "0xe00d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>20mp</i>",
        "iconName": "twenty_mp",
        "iconCode": "0xe00e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>21mp</i>",
        "iconName": "twenty_one_mp",
        "iconCode": "0xe00f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>22mp</i>",
        "iconName": "twenty_two_mp",
        "iconCode": "0xe010"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>23mp</i>",
        "iconName": "twenty_three_mp",
        "iconCode": "0xe011"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>24mp</i>",
        "iconName": "twenty_four_mp",
        "iconCode": "0xe012"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>2k</i>",
        "iconName": "two_k",
        "iconCode": "0xe013"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>2k_plus</i>",
        "iconName": "two_k_plus",
        "iconCode": "0xe014"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>2mp</i>",
        "iconName": "two_mp",
        "iconCode": "0xe015"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>30fps</i>",
        "iconName": "thirty_fps",
        "iconCode": "0xe016"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>30fps_select</i>",
        "iconName": "thirty_fps_select",
        "iconCode": "0xe017"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>360</i>",
        "iconName": "threesixty",
        "iconCode": "0xe018"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>3d_rotation</i>",
        "iconName": "threed_rotation",
        "iconCode": "0xe019"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>3g_mobiledata</i>",
        "iconName": "three_g_mobiledata",
        "iconCode": "0xe01a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>3k</i>",
        "iconName": "three_k",
        "iconCode": "0xe01b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>3k_plus</i>",
        "iconName": "three_k_plus",
        "iconCode": "0xe01c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>3mp</i>",
        "iconName": "three_mp",
        "iconCode": "0xe01d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>3p</i>",
        "iconName": "three_p",
        "iconCode": "0xe01e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>4g_mobiledata</i>",
        "iconName": "four_g_mobiledata",
        "iconCode": "0xe01f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>4g_plus_mobiledata</i>",
        "iconName": "four_g_plus_mobiledata",
        "iconCode": "0xe020"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>4k</i>",
        "iconName": "four_k",
        "iconCode": "0xe021"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>4k_plus</i>",
        "iconName": "four_k_plus",
        "iconCode": "0xe022"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>4mp</i>",
        "iconName": "four_mp",
        "iconCode": "0xe023"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>5g</i>",
        "iconName": "five_g",
        "iconCode": "0xe024"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>5k</i>",
        "iconName": "five_k",
        "iconCode": "0xe025"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>5k_plus</i>",
        "iconName": "five_k_plus",
        "iconCode": "0xe026"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>5mp</i>",
        "iconName": "five_mp",
        "iconCode": "0xe027"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>60fps</i>",
        "iconName": "sixty_fps",
        "iconCode": "0xe028"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>60fps_select</i>",
        "iconName": "sixty_fps_select",
        "iconCode": "0xe029"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>6_ft_apart</i>",
        "iconName": "six_ft_apart",
        "iconCode": "0xe02a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>6k</i>",
        "iconName": "six_k",
        "iconCode": "0xe02b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>6k_plus</i>",
        "iconName": "six_k_plus",
        "iconCode": "0xe02c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>6mp</i>",
        "iconName": "six_mp",
        "iconCode": "0xe02d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>7k</i>",
        "iconName": "seven_k",
        "iconCode": "0xe02e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>7k_plus</i>",
        "iconName": "seven_k_plus",
        "iconCode": "0xe02f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>7mp</i>",
        "iconName": "seven_mp",
        "iconCode": "0xe030"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>8k</i>",
        "iconName": "eight_k",
        "iconCode": "0xe031"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>8k_plus</i>",
        "iconName": "eight_k_plus",
        "iconCode": "0xe032"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>8mp</i>",
        "iconName": "eight_mp",
        "iconCode": "0xe033"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>9k</i>",
        "iconName": "nine_k",
        "iconCode": "0xe034"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>9k_plus</i>",
        "iconName": "nine_k_plus",
        "iconCode": "0xe035"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>9mp</i>",
        "iconName": "nine_mp",
        "iconCode": "0xe036"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>abc</i>",
        "iconName": "abc",
        "iconCode": "0xf04b6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>ac_unit</i>",
        "iconName": "ac_unit",
        "iconCode": "0xe037"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>access_alarm</i>",
        "iconName": "access_alarm",
        "iconCode": "0xe038"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>access_alarms</i>",
        "iconName": "access_alarms",
        "iconCode": "0xe039"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>access_time</i>",
        "iconName": "access_time",
        "iconCode": "0xe03a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>access_time_filled</i>",
        "iconName": "access_time_filled",
        "iconCode": "0xe03b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>accessibility</i>",
        "iconName": "accessibility",
        "iconCode": "0xe03c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>accessibility_new</i>",
        "iconName": "accessibility_new",
        "iconCode": "0xe03d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>accessible</i>",
        "iconName": "accessible",
        "iconCode": "0xe03e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>accessible_forward</i>",
        "iconName": "accessible_forward",
        "iconCode": "0xe03f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>account_balance</i>",
        "iconName": "account_balance",
        "iconCode": "0xe040"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>account_balance_wallet</i>",
        "iconName": "account_balance_wallet",
        "iconCode": "0xe041"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>account_box</i>",
        "iconName": "account_box",
        "iconCode": "0xe042"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>account_circle</i>",
        "iconName": "account_circle",
        "iconCode": "0xe043"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>account_tree</i>",
        "iconName": "account_tree",
        "iconCode": "0xe044"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>ad_units</i>",
        "iconName": "ad_units",
        "iconCode": "0xe045"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>adb</i>",
        "iconName": "adb",
        "iconCode": "0xe046"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add</i>",
        "iconName": "add",
        "iconCode": "0xe047"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_a_photo</i>",
        "iconName": "add_a_photo",
        "iconCode": "0xe048"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_alarm</i>",
        "iconName": "add_alarm",
        "iconCode": "0xe049"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_alert</i>",
        "iconName": "add_alert",
        "iconCode": "0xe04a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_box</i>",
        "iconName": "add_box",
        "iconCode": "0xe04b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_business</i>",
        "iconName": "add_business",
        "iconCode": "0xe04c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_call</i>",
        "iconName": "add_call",
        "iconCode": "0xe04d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_card</i>",
        "iconName": "add_card",
        "iconCode": "0xf04b7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_chart</i>",
        "iconName": "add_chart",
        "iconCode": "0xe04e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_circle</i>",
        "iconName": "add_circle",
        "iconCode": "0xe04f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_circle_outline</i>",
        "iconName": "add_circle_outline",
        "iconCode": "0xe050"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_comment</i>",
        "iconName": "add_comment",
        "iconCode": "0xe051"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_home</i>",
        "iconName": "add_home",
        "iconCode": "0xf0785"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_home_work</i>",
        "iconName": "add_home_work",
        "iconCode": "0xf0786"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_ic_call</i>",
        "iconName": "add_ic_call",
        "iconCode": "0xe052"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_link</i>",
        "iconName": "add_link",
        "iconCode": "0xe053"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_location</i>",
        "iconName": "add_location",
        "iconCode": "0xe054"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_location_alt</i>",
        "iconName": "add_location_alt",
        "iconCode": "0xe055"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_moderator</i>",
        "iconName": "add_moderator",
        "iconCode": "0xe056"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_photo_alternate</i>",
        "iconName": "add_photo_alternate",
        "iconCode": "0xe057"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_reaction</i>",
        "iconName": "add_reaction",
        "iconCode": "0xe058"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_road</i>",
        "iconName": "add_road",
        "iconCode": "0xe059"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_shopping_cart</i>",
        "iconName": "add_shopping_cart",
        "iconCode": "0xe05a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_task</i>",
        "iconName": "add_task",
        "iconCode": "0xe05b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_to_drive</i>",
        "iconName": "add_to_drive",
        "iconCode": "0xe05c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_to_home_screen</i>",
        "iconName": "add_to_home_screen",
        "iconCode": "0xe05d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_to_photos</i>",
        "iconName": "add_to_photos",
        "iconCode": "0xe05e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>add_to_queue</i>",
        "iconName": "add_to_queue",
        "iconCode": "0xe05f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>addchart</i>",
        "iconName": "addchart",
        "iconCode": "0xe060"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>adf_scanner</i>",
        "iconName": "adf_scanner",
        "iconCode": "0xf04b8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>adjust</i>",
        "iconName": "adjust",
        "iconCode": "0xe061"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>admin_panel_settings</i>",
        "iconName": "admin_panel_settings",
        "iconCode": "0xe062"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>adobe</i>",
        "iconName": "adobe",
        "iconCode": "0xf04b9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>ads_click</i>",
        "iconName": "ads_click",
        "iconCode": "0xf04ba"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>agriculture</i>",
        "iconName": "agriculture",
        "iconCode": "0xe063"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>air</i>",
        "iconName": "air",
        "iconCode": "0xe064"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airline_seat_flat</i>",
        "iconName": "airline_seat_flat",
        "iconCode": "0xe065"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airline_seat_flat_angled</i>",
        "iconName": "airline_seat_flat_angled",
        "iconCode": "0xe066"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airline_seat_individual_suite</i>",
        "iconName": "airline_seat_individual_suite",
        "iconCode": "0xe067"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airline_seat_legroom_extra</i>",
        "iconName": "airline_seat_legroom_extra",
        "iconCode": "0xe068"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airline_seat_legroom_normal</i>",
        "iconName": "airline_seat_legroom_normal",
        "iconCode": "0xe069"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airline_seat_legroom_reduced</i>",
        "iconName": "airline_seat_legroom_reduced",
        "iconCode": "0xe06a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airline_seat_recline_extra</i>",
        "iconName": "airline_seat_recline_extra",
        "iconCode": "0xe06b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airline_seat_recline_normal</i>",
        "iconName": "airline_seat_recline_normal",
        "iconCode": "0xe06c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airline_stops</i>",
        "iconName": "airline_stops",
        "iconCode": "0xf04bb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airlines</i>",
        "iconName": "airlines",
        "iconCode": "0xf04bc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airplane_ticket</i>",
        "iconName": "airplane_ticket",
        "iconCode": "0xe06d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airplanemode_active</i>",
        "iconName": "airplanemode_active",
        "iconCode": "0xe06e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airplanemode_inactive</i>",
        "iconName": "airplanemode_inactive",
        "iconCode": "0xe06f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airplanemode_off</i>",
        "iconName": "airplanemode_off",
        "iconCode": "0xe06f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airplanemode_on</i>",
        "iconName": "airplanemode_on",
        "iconCode": "0xe06e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airplay</i>",
        "iconName": "airplay",
        "iconCode": "0xe070"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>airport_shuttle</i>",
        "iconName": "airport_shuttle",
        "iconCode": "0xe071"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>alarm</i>",
        "iconName": "alarm",
        "iconCode": "0xe072"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>alarm_add</i>",
        "iconName": "alarm_add",
        "iconCode": "0xe073"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>alarm_off</i>",
        "iconName": "alarm_off",
        "iconCode": "0xe074"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>alarm_on</i>",
        "iconName": "alarm_on",
        "iconCode": "0xe075"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>album</i>",
        "iconName": "album",
        "iconCode": "0xe076"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>align_horizontal_center</i>",
        "iconName": "align_horizontal_center",
        "iconCode": "0xe077"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>align_horizontal_left</i>",
        "iconName": "align_horizontal_left",
        "iconCode": "0xe078"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>align_horizontal_right</i>",
        "iconName": "align_horizontal_right",
        "iconCode": "0xe079"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>align_vertical_bottom</i>",
        "iconName": "align_vertical_bottom",
        "iconCode": "0xe07a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>align_vertical_center</i>",
        "iconName": "align_vertical_center",
        "iconCode": "0xe07b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>align_vertical_top</i>",
        "iconName": "align_vertical_top",
        "iconCode": "0xe07c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>all_inbox</i>",
        "iconName": "all_inbox",
        "iconCode": "0xe07d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>all_inclusive</i>",
        "iconName": "all_inclusive",
        "iconCode": "0xe07e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>all_out</i>",
        "iconName": "all_out",
        "iconCode": "0xe07f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>alt_route</i>",
        "iconName": "alt_route",
        "iconCode": "0xe080"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>alternate_email</i>",
        "iconName": "alternate_email",
        "iconCode": "0xe081"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>amp_stories</i>",
        "iconName": "amp_stories",
        "iconCode": "0xe082"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>analytics</i>",
        "iconName": "analytics",
        "iconCode": "0xe083"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>anchor</i>",
        "iconName": "anchor",
        "iconCode": "0xe084"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>android</i>",
        "iconName": "android",
        "iconCode": "0xe085"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>animation</i>",
        "iconName": "animation",
        "iconCode": "0xe086"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>announcement</i>",
        "iconName": "announcement",
        "iconCode": "0xe087"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>aod</i>",
        "iconName": "aod",
        "iconCode": "0xe088"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>apartment</i>",
        "iconName": "apartment",
        "iconCode": "0xe089"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>api</i>",
        "iconName": "api",
        "iconCode": "0xe08a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>app_blocking</i>",
        "iconName": "app_blocking",
        "iconCode": "0xe08b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>app_registration</i>",
        "iconName": "app_registration",
        "iconCode": "0xe08c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>app_settings_alt</i>",
        "iconName": "app_settings_alt",
        "iconCode": "0xe08d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>app_shortcut</i>",
        "iconName": "app_shortcut",
        "iconCode": "0xf04bd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>apple</i>",
        "iconName": "apple",
        "iconCode": "0xf04be"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>approval</i>",
        "iconName": "approval",
        "iconCode": "0xe08e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>apps</i>",
        "iconName": "apps",
        "iconCode": "0xe08f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>apps_outage</i>",
        "iconName": "apps_outage",
        "iconCode": "0xf04bf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>architecture</i>",
        "iconName": "architecture",
        "iconCode": "0xe090"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>archive</i>",
        "iconName": "archive",
        "iconCode": "0xe091"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>area_chart</i>",
        "iconName": "area_chart",
        "iconCode": "0xf04c0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_back</i>",
        "iconName": "arrow_back",
        "iconCode": "0xe092"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_back_ios</i>",
        "iconName": "arrow_back_ios",
        "iconCode": "0xe093"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_back_ios_new</i>",
        "iconName": "arrow_back_ios_new",
        "iconCode": "0xe094"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_circle_down</i>",
        "iconName": "arrow_circle_down",
        "iconCode": "0xe095"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_circle_left</i>",
        "iconName": "arrow_circle_left",
        "iconCode": "0xf04c1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_circle_right</i>",
        "iconName": "arrow_circle_right",
        "iconCode": "0xf04c2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_circle_up</i>",
        "iconName": "arrow_circle_up",
        "iconCode": "0xe096"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_downward</i>",
        "iconName": "arrow_downward",
        "iconCode": "0xe097"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_drop_down</i>",
        "iconName": "arrow_drop_down",
        "iconCode": "0xe098"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_drop_down_circle</i>",
        "iconName": "arrow_drop_down_circle",
        "iconCode": "0xe099"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_drop_up</i>",
        "iconName": "arrow_drop_up",
        "iconCode": "0xe09a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_forward</i>",
        "iconName": "arrow_forward",
        "iconCode": "0xe09b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_forward_ios</i>",
        "iconName": "arrow_forward_ios",
        "iconCode": "0xe09c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_left</i>",
        "iconName": "arrow_left",
        "iconCode": "0xe09d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_right</i>",
        "iconName": "arrow_right",
        "iconCode": "0xe09e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_right_alt</i>",
        "iconName": "arrow_right_alt",
        "iconCode": "0xe09f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>arrow_upward</i>",
        "iconName": "arrow_upward",
        "iconCode": "0xe0a0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>art_track</i>",
        "iconName": "art_track",
        "iconCode": "0xe0a1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>article</i>",
        "iconName": "article",
        "iconCode": "0xe0a2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>aspect_ratio</i>",
        "iconName": "aspect_ratio",
        "iconCode": "0xe0a3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>assessment</i>",
        "iconName": "assessment",
        "iconCode": "0xe0a4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>assignment</i>",
        "iconName": "assignment",
        "iconCode": "0xe0a5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>assignment_ind</i>",
        "iconName": "assignment_ind",
        "iconCode": "0xe0a6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>assignment_late</i>",
        "iconName": "assignment_late",
        "iconCode": "0xe0a7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>assignment_return</i>",
        "iconName": "assignment_return",
        "iconCode": "0xe0a8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>assignment_returned</i>",
        "iconName": "assignment_returned",
        "iconCode": "0xe0a9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>assignment_turned_in</i>",
        "iconName": "assignment_turned_in",
        "iconCode": "0xe0aa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>assistant</i>",
        "iconName": "assistant",
        "iconCode": "0xe0ab"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>assistant_direction</i>",
        "iconName": "assistant_direction",
        "iconCode": "0xe0ac"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>assistant_navigation</i>",
        "iconName": "assistant_navigation",
        "iconCode": "0xe0ad"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>assistant_photo</i>",
        "iconName": "assistant_photo",
        "iconCode": "0xe0ae"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>assured_workload</i>",
        "iconName": "assured_workload",
        "iconCode": "0xf04c3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>atm</i>",
        "iconName": "atm",
        "iconCode": "0xe0af"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>attach_email</i>",
        "iconName": "attach_email",
        "iconCode": "0xe0b0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>attach_file</i>",
        "iconName": "attach_file",
        "iconCode": "0xe0b1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>attach_money</i>",
        "iconName": "attach_money",
        "iconCode": "0xe0b2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>attachment</i>",
        "iconName": "attachment",
        "iconCode": "0xe0b3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>attractions</i>",
        "iconName": "attractions",
        "iconCode": "0xe0b4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>attribution</i>",
        "iconName": "attribution",
        "iconCode": "0xe0b5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>audio_file</i>",
        "iconName": "audio_file",
        "iconCode": "0xf04c4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>audiotrack</i>",
        "iconName": "audiotrack",
        "iconCode": "0xe0b6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>auto_awesome</i>",
        "iconName": "auto_awesome",
        "iconCode": "0xe0b7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>auto_awesome_mosaic</i>",
        "iconName": "auto_awesome_mosaic",
        "iconCode": "0xe0b8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>auto_awesome_motion</i>",
        "iconName": "auto_awesome_motion",
        "iconCode": "0xe0b9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>auto_delete</i>",
        "iconName": "auto_delete",
        "iconCode": "0xe0ba"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>auto_fix_high</i>",
        "iconName": "auto_fix_high",
        "iconCode": "0xe0bb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>auto_fix_normal</i>",
        "iconName": "auto_fix_normal",
        "iconCode": "0xe0bc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>auto_fix_off</i>",
        "iconName": "auto_fix_off",
        "iconCode": "0xe0bd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>auto_graph</i>",
        "iconName": "auto_graph",
        "iconCode": "0xe0be"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>auto_mode</i>",
        "iconName": "auto_mode",
        "iconCode": "0xf0787"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>auto_stories</i>",
        "iconName": "auto_stories",
        "iconCode": "0xe0bf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>autofps_select</i>",
        "iconName": "autofps_select",
        "iconCode": "0xe0c0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>autorenew</i>",
        "iconName": "autorenew",
        "iconCode": "0xe0c1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>av_timer</i>",
        "iconName": "av_timer",
        "iconCode": "0xe0c2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>baby_changing_station</i>",
        "iconName": "baby_changing_station",
        "iconCode": "0xe0c3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>back_hand</i>",
        "iconName": "back_hand",
        "iconCode": "0xf04c5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>backpack</i>",
        "iconName": "backpack",
        "iconCode": "0xe0c4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>backspace</i>",
        "iconName": "backspace",
        "iconCode": "0xe0c5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>backup</i>",
        "iconName": "backup",
        "iconCode": "0xe0c6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>backup_table</i>",
        "iconName": "backup_table",
        "iconCode": "0xe0c7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>badge</i>",
        "iconName": "badge",
        "iconCode": "0xe0c8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bakery_dining</i>",
        "iconName": "bakery_dining",
        "iconCode": "0xe0c9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>balance</i>",
        "iconName": "balance",
        "iconCode": "0xf04c6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>balcony</i>",
        "iconName": "balcony",
        "iconCode": "0xe0ca"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>ballot</i>",
        "iconName": "ballot",
        "iconCode": "0xe0cb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bar_chart</i>",
        "iconName": "bar_chart",
        "iconCode": "0xe0cc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>batch_prediction</i>",
        "iconName": "batch_prediction",
        "iconCode": "0xe0cd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bathroom</i>",
        "iconName": "bathroom",
        "iconCode": "0xe0ce"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bathtub</i>",
        "iconName": "bathtub",
        "iconCode": "0xe0cf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>battery_0_bar</i>",
        "iconName": "battery_0_bar",
        "iconCode": "0xf0788"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>battery_1_bar</i>",
        "iconName": "battery_1_bar",
        "iconCode": "0xf0789"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>battery_2_bar</i>",
        "iconName": "battery_2_bar",
        "iconCode": "0xf078a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>battery_3_bar</i>",
        "iconName": "battery_3_bar",
        "iconCode": "0xf078b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>battery_4_bar</i>",
        "iconName": "battery_4_bar",
        "iconCode": "0xf078c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>battery_5_bar</i>",
        "iconName": "battery_5_bar",
        "iconCode": "0xf078d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>battery_6_bar</i>",
        "iconName": "battery_6_bar",
        "iconCode": "0xf078e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>battery_alert</i>",
        "iconName": "battery_alert",
        "iconCode": "0xe0d0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>battery_charging_full</i>",
        "iconName": "battery_charging_full",
        "iconCode": "0xe0d1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>battery_full</i>",
        "iconName": "battery_full",
        "iconCode": "0xe0d2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>battery_saver</i>",
        "iconName": "battery_saver",
        "iconCode": "0xe0d3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>battery_std</i>",
        "iconName": "battery_std",
        "iconCode": "0xe0d4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>battery_unknown</i>",
        "iconName": "battery_unknown",
        "iconCode": "0xe0d5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>beach_access</i>",
        "iconName": "beach_access",
        "iconCode": "0xe0d6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bed</i>",
        "iconName": "bed",
        "iconCode": "0xe0d7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bedroom_baby</i>",
        "iconName": "bedroom_baby",
        "iconCode": "0xe0d8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bedroom_child</i>",
        "iconName": "bedroom_child",
        "iconCode": "0xe0d9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bedroom_parent</i>",
        "iconName": "bedroom_parent",
        "iconCode": "0xe0da"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bedtime</i>",
        "iconName": "bedtime",
        "iconCode": "0xe0db"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bedtime_off</i>",
        "iconName": "bedtime_off",
        "iconCode": "0xf04c7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>beenhere</i>",
        "iconName": "beenhere",
        "iconCode": "0xe0dc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bento</i>",
        "iconName": "bento",
        "iconCode": "0xe0dd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bike_scooter</i>",
        "iconName": "bike_scooter",
        "iconCode": "0xe0de"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>biotech</i>",
        "iconName": "biotech",
        "iconCode": "0xe0df"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>blender</i>",
        "iconName": "blender",
        "iconCode": "0xe0e0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>blinds</i>",
        "iconName": "blinds",
        "iconCode": "0xf078f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>blinds_closed</i>",
        "iconName": "blinds_closed",
        "iconCode": "0xf0790"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>block</i>",
        "iconName": "block",
        "iconCode": "0xe0e1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>block_flipped</i>",
        "iconName": "block_flipped",
        "iconCode": "0xe0e2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bloodtype</i>",
        "iconName": "bloodtype",
        "iconCode": "0xe0e3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bluetooth</i>",
        "iconName": "bluetooth",
        "iconCode": "0xe0e4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bluetooth_audio</i>",
        "iconName": "bluetooth_audio",
        "iconCode": "0xe0e5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bluetooth_connected</i>",
        "iconName": "bluetooth_connected",
        "iconCode": "0xe0e6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bluetooth_disabled</i>",
        "iconName": "bluetooth_disabled",
        "iconCode": "0xe0e7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bluetooth_drive</i>",
        "iconName": "bluetooth_drive",
        "iconCode": "0xe0e8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bluetooth_searching</i>",
        "iconName": "bluetooth_searching",
        "iconCode": "0xe0e9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>blur_circular</i>",
        "iconName": "blur_circular",
        "iconCode": "0xe0ea"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>blur_linear</i>",
        "iconName": "blur_linear",
        "iconCode": "0xe0eb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>blur_off</i>",
        "iconName": "blur_off",
        "iconCode": "0xe0ec"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>blur_on</i>",
        "iconName": "blur_on",
        "iconCode": "0xe0ed"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bolt</i>",
        "iconName": "bolt",
        "iconCode": "0xe0ee"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>book</i>",
        "iconName": "book",
        "iconCode": "0xe0ef"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>book_online</i>",
        "iconName": "book_online",
        "iconCode": "0xe0f0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bookmark</i>",
        "iconName": "bookmark",
        "iconCode": "0xe0f1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bookmark_add</i>",
        "iconName": "bookmark_add",
        "iconCode": "0xe0f2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bookmark_added</i>",
        "iconName": "bookmark_added",
        "iconCode": "0xe0f3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bookmark_border</i>",
        "iconName": "bookmark_border",
        "iconCode": "0xe0f4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bookmark_outline</i>",
        "iconName": "bookmark_outline",
        "iconCode": "0xe0f4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bookmark_remove</i>",
        "iconName": "bookmark_remove",
        "iconCode": "0xe0f5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bookmarks</i>",
        "iconName": "bookmarks",
        "iconCode": "0xe0f6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>border_all</i>",
        "iconName": "border_all",
        "iconCode": "0xe0f7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>border_bottom</i>",
        "iconName": "border_bottom",
        "iconCode": "0xe0f8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>border_clear</i>",
        "iconName": "border_clear",
        "iconCode": "0xe0f9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>border_color</i>",
        "iconName": "border_color",
        "iconCode": "0xe0fa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>border_horizontal</i>",
        "iconName": "border_horizontal",
        "iconCode": "0xe0fb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>border_inner</i>",
        "iconName": "border_inner",
        "iconCode": "0xe0fc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>border_left</i>",
        "iconName": "border_left",
        "iconCode": "0xe0fd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>border_outer</i>",
        "iconName": "border_outer",
        "iconCode": "0xe0fe"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>border_right</i>",
        "iconName": "border_right",
        "iconCode": "0xe0ff"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>border_style</i>",
        "iconName": "border_style",
        "iconCode": "0xe100"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>border_top</i>",
        "iconName": "border_top",
        "iconCode": "0xe101"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>border_vertical</i>",
        "iconName": "border_vertical",
        "iconCode": "0xe102"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>boy</i>",
        "iconName": "boy",
        "iconCode": "0xf04c8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>branding_watermark</i>",
        "iconName": "branding_watermark",
        "iconCode": "0xe103"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>breakfast_dining</i>",
        "iconName": "breakfast_dining",
        "iconCode": "0xe104"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>brightness_1</i>",
        "iconName": "brightness_1",
        "iconCode": "0xe105"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>brightness_2</i>",
        "iconName": "brightness_2",
        "iconCode": "0xe106"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>brightness_3</i>",
        "iconName": "brightness_3",
        "iconCode": "0xe107"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>brightness_4</i>",
        "iconName": "brightness_4",
        "iconCode": "0xe108"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>brightness_5</i>",
        "iconName": "brightness_5",
        "iconCode": "0xe109"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>brightness_6</i>",
        "iconName": "brightness_6",
        "iconCode": "0xe10a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>brightness_7</i>",
        "iconName": "brightness_7",
        "iconCode": "0xe10b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>brightness_auto</i>",
        "iconName": "brightness_auto",
        "iconCode": "0xe10c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>brightness_high</i>",
        "iconName": "brightness_high",
        "iconCode": "0xe10d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>brightness_low</i>",
        "iconName": "brightness_low",
        "iconCode": "0xe10e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>brightness_medium</i>",
        "iconName": "brightness_medium",
        "iconCode": "0xe10f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>broadcast_on_home</i>",
        "iconName": "broadcast_on_home",
        "iconCode": "0xf0791"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>broadcast_on_personal</i>",
        "iconName": "broadcast_on_personal",
        "iconCode": "0xf0792"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>broken_image</i>",
        "iconName": "broken_image",
        "iconCode": "0xe110"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>browse_gallery</i>",
        "iconName": "browse_gallery",
        "iconCode": "0xf06ba"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>browser_not_supported</i>",
        "iconName": "browser_not_supported",
        "iconCode": "0xe111"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>browser_updated</i>",
        "iconName": "browser_updated",
        "iconCode": "0xf04c9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>brunch_dining</i>",
        "iconName": "brunch_dining",
        "iconCode": "0xe112"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>brush</i>",
        "iconName": "brush",
        "iconCode": "0xe113"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bubble_chart</i>",
        "iconName": "bubble_chart",
        "iconCode": "0xe114"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bug_report</i>",
        "iconName": "bug_report",
        "iconCode": "0xe115"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>build</i>",
        "iconName": "build",
        "iconCode": "0xe116"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>build_circle</i>",
        "iconName": "build_circle",
        "iconCode": "0xe117"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bungalow</i>",
        "iconName": "bungalow",
        "iconCode": "0xe118"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>burst_mode</i>",
        "iconName": "burst_mode",
        "iconCode": "0xe119"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>bus_alert</i>",
        "iconName": "bus_alert",
        "iconCode": "0xe11a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>business</i>",
        "iconName": "business",
        "iconCode": "0xe11b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>business_center</i>",
        "iconName": "business_center",
        "iconCode": "0xe11c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cabin</i>",
        "iconName": "cabin",
        "iconCode": "0xe11d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cable</i>",
        "iconName": "cable",
        "iconCode": "0xe11e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cached</i>",
        "iconName": "cached",
        "iconCode": "0xe11f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cake</i>",
        "iconName": "cake",
        "iconCode": "0xe120"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>calculate</i>",
        "iconName": "calculate",
        "iconCode": "0xe121"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>calendar_month</i>",
        "iconName": "calendar_month",
        "iconCode": "0xf06bb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>calendar_today</i>",
        "iconName": "calendar_today",
        "iconCode": "0xe122"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>calendar_view_day</i>",
        "iconName": "calendar_view_day",
        "iconCode": "0xe123"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>calendar_view_month</i>",
        "iconName": "calendar_view_month",
        "iconCode": "0xe124"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>calendar_view_week</i>",
        "iconName": "calendar_view_week",
        "iconCode": "0xe125"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>call</i>",
        "iconName": "call",
        "iconCode": "0xe126"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>call_end</i>",
        "iconName": "call_end",
        "iconCode": "0xe127"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>call_made</i>",
        "iconName": "call_made",
        "iconCode": "0xe128"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>call_merge</i>",
        "iconName": "call_merge",
        "iconCode": "0xe129"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>call_missed</i>",
        "iconName": "call_missed",
        "iconCode": "0xe12a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>call_missed_outgoing</i>",
        "iconName": "call_missed_outgoing",
        "iconCode": "0xe12b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>call_received</i>",
        "iconName": "call_received",
        "iconCode": "0xe12c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>call_split</i>",
        "iconName": "call_split",
        "iconCode": "0xe12d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>call_to_action</i>",
        "iconName": "call_to_action",
        "iconCode": "0xe12e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>camera</i>",
        "iconName": "camera",
        "iconCode": "0xe12f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>camera_alt</i>",
        "iconName": "camera_alt",
        "iconCode": "0xe130"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>camera_enhance</i>",
        "iconName": "camera_enhance",
        "iconCode": "0xe131"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>camera_front</i>",
        "iconName": "camera_front",
        "iconCode": "0xe132"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>camera_indoor</i>",
        "iconName": "camera_indoor",
        "iconCode": "0xe133"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>camera_outdoor</i>",
        "iconName": "camera_outdoor",
        "iconCode": "0xe134"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>camera_rear</i>",
        "iconName": "camera_rear",
        "iconCode": "0xe135"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>camera_roll</i>",
        "iconName": "camera_roll",
        "iconCode": "0xe136"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cameraswitch</i>",
        "iconName": "cameraswitch",
        "iconCode": "0xe137"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>campaign</i>",
        "iconName": "campaign",
        "iconCode": "0xe138"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cancel</i>",
        "iconName": "cancel",
        "iconCode": "0xe139"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cancel_presentation</i>",
        "iconName": "cancel_presentation",
        "iconCode": "0xe13a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cancel_schedule_send</i>",
        "iconName": "cancel_schedule_send",
        "iconCode": "0xe13b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>candlestick_chart</i>",
        "iconName": "candlestick_chart",
        "iconCode": "0xf04ca"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>car_crash</i>",
        "iconName": "car_crash",
        "iconCode": "0xf0793"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>car_rental</i>",
        "iconName": "car_rental",
        "iconCode": "0xe13c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>car_repair</i>",
        "iconName": "car_repair",
        "iconCode": "0xe13d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>card_giftcard</i>",
        "iconName": "card_giftcard",
        "iconCode": "0xe13e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>card_membership</i>",
        "iconName": "card_membership",
        "iconCode": "0xe13f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>card_travel</i>",
        "iconName": "card_travel",
        "iconCode": "0xe140"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>carpenter</i>",
        "iconName": "carpenter",
        "iconCode": "0xe141"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cases</i>",
        "iconName": "cases",
        "iconCode": "0xe142"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>casino</i>",
        "iconName": "casino",
        "iconCode": "0xe143"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cast</i>",
        "iconName": "cast",
        "iconCode": "0xe144"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cast_connected</i>",
        "iconName": "cast_connected",
        "iconCode": "0xe145"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cast_for_education</i>",
        "iconName": "cast_for_education",
        "iconCode": "0xe146"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>castle</i>",
        "iconName": "castle",
        "iconCode": "0xf04cb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>catching_pokemon</i>",
        "iconName": "catching_pokemon",
        "iconCode": "0xe147"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>category</i>",
        "iconName": "category",
        "iconCode": "0xe148"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>celebration</i>",
        "iconName": "celebration",
        "iconCode": "0xe149"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cell_tower</i>",
        "iconName": "cell_tower",
        "iconCode": "0xf04cc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cell_wifi</i>",
        "iconName": "cell_wifi",
        "iconCode": "0xe14a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>center_focus_strong</i>",
        "iconName": "center_focus_strong",
        "iconCode": "0xe14b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>center_focus_weak</i>",
        "iconName": "center_focus_weak",
        "iconCode": "0xe14c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>chair</i>",
        "iconName": "chair",
        "iconCode": "0xe14d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>chair_alt</i>",
        "iconName": "chair_alt",
        "iconCode": "0xe14e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>chalet</i>",
        "iconName": "chalet",
        "iconCode": "0xe14f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>change_circle</i>",
        "iconName": "change_circle",
        "iconCode": "0xe150"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>change_history</i>",
        "iconName": "change_history",
        "iconCode": "0xe151"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>charging_station</i>",
        "iconName": "charging_station",
        "iconCode": "0xe152"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>chat</i>",
        "iconName": "chat",
        "iconCode": "0xe153"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>chat_bubble</i>",
        "iconName": "chat_bubble",
        "iconCode": "0xe154"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>chat_bubble_outline</i>",
        "iconName": "chat_bubble_outline",
        "iconCode": "0xe155"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>check</i>",
        "iconName": "check",
        "iconCode": "0xe156"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>check_box</i>",
        "iconName": "check_box",
        "iconCode": "0xe157"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>check_box_outline_blank</i>",
        "iconName": "check_box_outline_blank",
        "iconCode": "0xe158"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>check_circle</i>",
        "iconName": "check_circle",
        "iconCode": "0xe159"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>check_circle_outline</i>",
        "iconName": "check_circle_outline",
        "iconCode": "0xe15a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>checklist</i>",
        "iconName": "checklist",
        "iconCode": "0xe15b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>checklist_rtl</i>",
        "iconName": "checklist_rtl",
        "iconCode": "0xe15c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>checkroom</i>",
        "iconName": "checkroom",
        "iconCode": "0xe15d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>chevron_left</i>",
        "iconName": "chevron_left",
        "iconCode": "0xe15e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>chevron_right</i>",
        "iconName": "chevron_right",
        "iconCode": "0xe15f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>child_care</i>",
        "iconName": "child_care",
        "iconCode": "0xe160"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>child_friendly</i>",
        "iconName": "child_friendly",
        "iconCode": "0xe161"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>chrome_reader_mode</i>",
        "iconName": "chrome_reader_mode",
        "iconCode": "0xe162"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>church</i>",
        "iconName": "church",
        "iconCode": "0xf04cd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>circle</i>",
        "iconName": "circle",
        "iconCode": "0xe163"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>circle_notifications</i>",
        "iconName": "circle_notifications",
        "iconCode": "0xe164"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>class</i>",
        "iconName": "class_",
        "iconCode": "0xe165"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>clean_hands</i>",
        "iconName": "clean_hands",
        "iconCode": "0xe166"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cleaning_services</i>",
        "iconName": "cleaning_services",
        "iconCode": "0xe167"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>clear</i>",
        "iconName": "clear",
        "iconCode": "0xe168"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>clear_all</i>",
        "iconName": "clear_all",
        "iconCode": "0xe169"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>close</i>",
        "iconName": "close",
        "iconCode": "0xe16a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>close_fullscreen</i>",
        "iconName": "close_fullscreen",
        "iconCode": "0xe16b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>closed_caption</i>",
        "iconName": "closed_caption",
        "iconCode": "0xe16c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>closed_caption_disabled</i>",
        "iconName": "closed_caption_disabled",
        "iconCode": "0xe16d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>closed_caption_off</i>",
        "iconName": "closed_caption_off",
        "iconCode": "0xe16e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cloud</i>",
        "iconName": "cloud",
        "iconCode": "0xe16f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cloud_circle</i>",
        "iconName": "cloud_circle",
        "iconCode": "0xe170"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cloud_done</i>",
        "iconName": "cloud_done",
        "iconCode": "0xe171"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cloud_download</i>",
        "iconName": "cloud_download",
        "iconCode": "0xe172"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cloud_off</i>",
        "iconName": "cloud_off",
        "iconCode": "0xe173"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cloud_queue</i>",
        "iconName": "cloud_queue",
        "iconCode": "0xe174"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cloud_sync</i>",
        "iconName": "cloud_sync",
        "iconCode": "0xf04ce"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cloud_upload</i>",
        "iconName": "cloud_upload",
        "iconCode": "0xe175"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cloudy_snowing</i>",
        "iconName": "cloudy_snowing",
        "iconCode": "0xf04cf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>co2</i>",
        "iconName": "co2",
        "iconCode": "0xf04d0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>co_present</i>",
        "iconName": "co_present",
        "iconCode": "0xf04d1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>code</i>",
        "iconName": "code",
        "iconCode": "0xe176"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>code_off</i>",
        "iconName": "code_off",
        "iconCode": "0xe177"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>coffee</i>",
        "iconName": "coffee",
        "iconCode": "0xe178"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>coffee_maker</i>",
        "iconName": "coffee_maker",
        "iconCode": "0xe179"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>collections</i>",
        "iconName": "collections",
        "iconCode": "0xe17a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>collections_bookmark</i>",
        "iconName": "collections_bookmark",
        "iconCode": "0xe17b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>color_lens</i>",
        "iconName": "color_lens",
        "iconCode": "0xe17c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>colorize</i>",
        "iconName": "colorize",
        "iconCode": "0xe17d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>comment</i>",
        "iconName": "comment",
        "iconCode": "0xe17e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>comment_bank</i>",
        "iconName": "comment_bank",
        "iconCode": "0xe17f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>comments_disabled</i>",
        "iconName": "comments_disabled",
        "iconCode": "0xf04d2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>commit</i>",
        "iconName": "commit",
        "iconCode": "0xf04d3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>commute</i>",
        "iconName": "commute",
        "iconCode": "0xe180"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>compare</i>",
        "iconName": "compare",
        "iconCode": "0xe181"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>compare_arrows</i>",
        "iconName": "compare_arrows",
        "iconCode": "0xe182"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>compass_calibration</i>",
        "iconName": "compass_calibration",
        "iconCode": "0xe183"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>compost</i>",
        "iconName": "compost",
        "iconCode": "0xf04d4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>compress</i>",
        "iconName": "compress",
        "iconCode": "0xe184"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>computer</i>",
        "iconName": "computer",
        "iconCode": "0xe185"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>confirmation_num</i>",
        "iconName": "confirmation_num",
        "iconCode": "0xe186"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>confirmation_number</i>",
        "iconName": "confirmation_number",
        "iconCode": "0xe186"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>connect_without_contact</i>",
        "iconName": "connect_without_contact",
        "iconCode": "0xe187"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>connected_tv</i>",
        "iconName": "connected_tv",
        "iconCode": "0xe188"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>connecting_airports</i>",
        "iconName": "connecting_airports",
        "iconCode": "0xf04d5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>construction</i>",
        "iconName": "construction",
        "iconCode": "0xe189"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>contact_mail</i>",
        "iconName": "contact_mail",
        "iconCode": "0xe18a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>contact_page</i>",
        "iconName": "contact_page",
        "iconCode": "0xe18b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>contact_phone</i>",
        "iconName": "contact_phone",
        "iconCode": "0xe18c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>contact_support</i>",
        "iconName": "contact_support",
        "iconCode": "0xe18d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>contactless</i>",
        "iconName": "contactless",
        "iconCode": "0xe18e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>contacts</i>",
        "iconName": "contacts",
        "iconCode": "0xe18f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>content_copy</i>",
        "iconName": "content_copy",
        "iconCode": "0xe190"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>content_cut</i>",
        "iconName": "content_cut",
        "iconCode": "0xe191"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>content_paste</i>",
        "iconName": "content_paste",
        "iconCode": "0xe192"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>content_paste_go</i>",
        "iconName": "content_paste_go",
        "iconCode": "0xf04d6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>content_paste_off</i>",
        "iconName": "content_paste_off",
        "iconCode": "0xe193"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>content_paste_search</i>",
        "iconName": "content_paste_search",
        "iconCode": "0xf04d7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>contrast</i>",
        "iconName": "contrast",
        "iconCode": "0xf04d8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>control_camera</i>",
        "iconName": "control_camera",
        "iconCode": "0xe194"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>control_point</i>",
        "iconName": "control_point",
        "iconCode": "0xe195"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>control_point_duplicate</i>",
        "iconName": "control_point_duplicate",
        "iconCode": "0xe196"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cookie</i>",
        "iconName": "cookie",
        "iconCode": "0xf04d9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>copy</i>",
        "iconName": "copy",
        "iconCode": "0xe190"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>copy_all</i>",
        "iconName": "copy_all",
        "iconCode": "0xe197"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>copyright</i>",
        "iconName": "copyright",
        "iconCode": "0xe198"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>coronavirus</i>",
        "iconName": "coronavirus",
        "iconCode": "0xe199"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>corporate_fare</i>",
        "iconName": "corporate_fare",
        "iconCode": "0xe19a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cottage</i>",
        "iconName": "cottage",
        "iconCode": "0xe19b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>countertops</i>",
        "iconName": "countertops",
        "iconCode": "0xe19c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>create</i>",
        "iconName": "create",
        "iconCode": "0xe19d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>create_new_folder</i>",
        "iconName": "create_new_folder",
        "iconCode": "0xe19e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>credit_card</i>",
        "iconName": "credit_card",
        "iconCode": "0xe19f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>credit_card_off</i>",
        "iconName": "credit_card_off",
        "iconCode": "0xe1a0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>credit_score</i>",
        "iconName": "credit_score",
        "iconCode": "0xe1a1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>crib</i>",
        "iconName": "crib",
        "iconCode": "0xe1a2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>crisis_alert</i>",
        "iconName": "crisis_alert",
        "iconCode": "0xf0794"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>crop</i>",
        "iconName": "crop",
        "iconCode": "0xe1a3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>crop_16_9</i>",
        "iconName": "crop_16_9",
        "iconCode": "0xe1a4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>crop_3_2</i>",
        "iconName": "crop_3_2",
        "iconCode": "0xe1a5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>crop_5_4</i>",
        "iconName": "crop_5_4",
        "iconCode": "0xe1a6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>crop_7_5</i>",
        "iconName": "crop_7_5",
        "iconCode": "0xe1a7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>crop_din</i>",
        "iconName": "crop_din",
        "iconCode": "0xe1a8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>crop_free</i>",
        "iconName": "crop_free",
        "iconCode": "0xe1a9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>crop_landscape</i>",
        "iconName": "crop_landscape",
        "iconCode": "0xe1aa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>crop_original</i>",
        "iconName": "crop_original",
        "iconCode": "0xe1ab"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>crop_portrait</i>",
        "iconName": "crop_portrait",
        "iconCode": "0xe1ac"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>crop_rotate</i>",
        "iconName": "crop_rotate",
        "iconCode": "0xe1ad"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>crop_square</i>",
        "iconName": "crop_square",
        "iconCode": "0xe1ae"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cruelty_free</i>",
        "iconName": "cruelty_free",
        "iconCode": "0xf04da"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>css</i>",
        "iconName": "css",
        "iconCode": "0xf04db"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>currency_bitcoin</i>",
        "iconName": "currency_bitcoin",
        "iconCode": "0xf06bc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>currency_exchange</i>",
        "iconName": "currency_exchange",
        "iconCode": "0xf04dc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>currency_franc</i>",
        "iconName": "currency_franc",
        "iconCode": "0xf04dd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>currency_lira</i>",
        "iconName": "currency_lira",
        "iconCode": "0xf04de"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>currency_pound</i>",
        "iconName": "currency_pound",
        "iconCode": "0xf04df"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>currency_ruble</i>",
        "iconName": "currency_ruble",
        "iconCode": "0xf04e0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>currency_rupee</i>",
        "iconName": "currency_rupee",
        "iconCode": "0xf04e1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>currency_yen</i>",
        "iconName": "currency_yen",
        "iconCode": "0xf04e2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>currency_yuan</i>",
        "iconName": "currency_yuan",
        "iconCode": "0xf04e3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>curtains</i>",
        "iconName": "curtains",
        "iconCode": "0xf0795"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>curtains_closed</i>",
        "iconName": "curtains_closed",
        "iconCode": "0xf0796"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cut</i>",
        "iconName": "cut",
        "iconCode": "0xe191"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>cyclone</i>",
        "iconName": "cyclone",
        "iconCode": "0xf0797"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dangerous</i>",
        "iconName": "dangerous",
        "iconCode": "0xe1af"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dark_mode</i>",
        "iconName": "dark_mode",
        "iconCode": "0xe1b0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dashboard</i>",
        "iconName": "dashboard",
        "iconCode": "0xe1b1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dashboard_customize</i>",
        "iconName": "dashboard_customize",
        "iconCode": "0xe1b2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>data_array</i>",
        "iconName": "data_array",
        "iconCode": "0xf04e4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>data_exploration</i>",
        "iconName": "data_exploration",
        "iconCode": "0xf04e5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>data_object</i>",
        "iconName": "data_object",
        "iconCode": "0xf04e6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>data_saver_off</i>",
        "iconName": "data_saver_off",
        "iconCode": "0xe1b3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>data_saver_on</i>",
        "iconName": "data_saver_on",
        "iconCode": "0xe1b4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>data_thresholding</i>",
        "iconName": "data_thresholding",
        "iconCode": "0xf04e7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>data_usage</i>",
        "iconName": "data_usage",
        "iconCode": "0xe1b5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dataset</i>",
        "iconName": "dataset",
        "iconCode": "0xf0798"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dataset_linked</i>",
        "iconName": "dataset_linked",
        "iconCode": "0xf0799"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>date_range</i>",
        "iconName": "date_range",
        "iconCode": "0xe1b6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>deblur</i>",
        "iconName": "deblur",
        "iconCode": "0xf04e8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>deck</i>",
        "iconName": "deck",
        "iconCode": "0xe1b7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dehaze</i>",
        "iconName": "dehaze",
        "iconCode": "0xe1b8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>delete</i>",
        "iconName": "delete",
        "iconCode": "0xe1b9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>delete_forever</i>",
        "iconName": "delete_forever",
        "iconCode": "0xe1ba"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>delete_outline</i>",
        "iconName": "delete_outline",
        "iconCode": "0xe1bb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>delete_sweep</i>",
        "iconName": "delete_sweep",
        "iconCode": "0xe1bc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>delivery_dining</i>",
        "iconName": "delivery_dining",
        "iconCode": "0xe1bd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>density_large</i>",
        "iconName": "density_large",
        "iconCode": "0xf04e9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>density_medium</i>",
        "iconName": "density_medium",
        "iconCode": "0xf04ea"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>density_small</i>",
        "iconName": "density_small",
        "iconCode": "0xf04eb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>departure_board</i>",
        "iconName": "departure_board",
        "iconCode": "0xe1be"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>description</i>",
        "iconName": "description",
        "iconCode": "0xe1bf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>deselect</i>",
        "iconName": "deselect",
        "iconCode": "0xf04ec"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>design_services</i>",
        "iconName": "design_services",
        "iconCode": "0xe1c0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>desk</i>",
        "iconName": "desk",
        "iconCode": "0xf079a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>desktop_access_disabled</i>",
        "iconName": "desktop_access_disabled",
        "iconCode": "0xe1c1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>desktop_mac</i>",
        "iconName": "desktop_mac",
        "iconCode": "0xe1c2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>desktop_windows</i>",
        "iconName": "desktop_windows",
        "iconCode": "0xe1c3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>details</i>",
        "iconName": "details",
        "iconCode": "0xe1c4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>developer_board</i>",
        "iconName": "developer_board",
        "iconCode": "0xe1c5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>developer_board_off</i>",
        "iconName": "developer_board_off",
        "iconCode": "0xe1c6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>developer_mode</i>",
        "iconName": "developer_mode",
        "iconCode": "0xe1c7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>device_hub</i>",
        "iconName": "device_hub",
        "iconCode": "0xe1c8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>device_thermostat</i>",
        "iconName": "device_thermostat",
        "iconCode": "0xe1c9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>device_unknown</i>",
        "iconName": "device_unknown",
        "iconCode": "0xe1ca"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>devices</i>",
        "iconName": "devices",
        "iconCode": "0xe1cb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>devices_fold</i>",
        "iconName": "devices_fold",
        "iconCode": "0xf079b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>devices_other</i>",
        "iconName": "devices_other",
        "iconCode": "0xe1cc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dialer_sip</i>",
        "iconName": "dialer_sip",
        "iconCode": "0xe1cd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dialpad</i>",
        "iconName": "dialpad",
        "iconCode": "0xe1ce"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>diamond</i>",
        "iconName": "diamond",
        "iconCode": "0xf04ed"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>difference</i>",
        "iconName": "difference",
        "iconCode": "0xf04ee"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dining</i>",
        "iconName": "dining",
        "iconCode": "0xe1cf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dinner_dining</i>",
        "iconName": "dinner_dining",
        "iconCode": "0xe1d0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions</i>",
        "iconName": "directions",
        "iconCode": "0xe1d1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_bike</i>",
        "iconName": "directions_bike",
        "iconCode": "0xe1d2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_boat</i>",
        "iconName": "directions_boat",
        "iconCode": "0xe1d3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_boat_filled</i>",
        "iconName": "directions_boat_filled",
        "iconCode": "0xe1d4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_bus</i>",
        "iconName": "directions_bus",
        "iconCode": "0xe1d5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_bus_filled</i>",
        "iconName": "directions_bus_filled",
        "iconCode": "0xe1d6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_car</i>",
        "iconName": "directions_car",
        "iconCode": "0xe1d7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_car_filled</i>",
        "iconName": "directions_car_filled",
        "iconCode": "0xe1d8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_ferry</i>",
        "iconName": "directions_ferry",
        "iconCode": "0xe1d3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_off</i>",
        "iconName": "directions_off",
        "iconCode": "0xe1d9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_railway</i>",
        "iconName": "directions_railway",
        "iconCode": "0xe1da"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_railway_filled</i>",
        "iconName": "directions_railway_filled",
        "iconCode": "0xe1db"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_run</i>",
        "iconName": "directions_run",
        "iconCode": "0xe1dc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_subway</i>",
        "iconName": "directions_subway",
        "iconCode": "0xe1dd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_subway_filled</i>",
        "iconName": "directions_subway_filled",
        "iconCode": "0xe1de"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_train</i>",
        "iconName": "directions_train",
        "iconCode": "0xe1da"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_transit</i>",
        "iconName": "directions_transit",
        "iconCode": "0xe1df"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_transit_filled</i>",
        "iconName": "directions_transit_filled",
        "iconCode": "0xe1e0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>directions_walk</i>",
        "iconName": "directions_walk",
        "iconCode": "0xe1e1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dirty_lens</i>",
        "iconName": "dirty_lens",
        "iconCode": "0xe1e2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>disabled_by_default</i>",
        "iconName": "disabled_by_default",
        "iconCode": "0xe1e3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>disabled_visible</i>",
        "iconName": "disabled_visible",
        "iconCode": "0xf04ef"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>disc_full</i>",
        "iconName": "disc_full",
        "iconCode": "0xe1e4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>discord</i>",
        "iconName": "discord",
        "iconCode": "0xf04f0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>discount</i>",
        "iconName": "discount",
        "iconCode": "0xf06bd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>display_settings</i>",
        "iconName": "display_settings",
        "iconCode": "0xf04f1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dnd_forwardslash</i>",
        "iconName": "dnd_forwardslash",
        "iconCode": "0xe1eb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dns</i>",
        "iconName": "dns",
        "iconCode": "0xe1e5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>do_disturb</i>",
        "iconName": "do_disturb",
        "iconCode": "0xe1e6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>do_disturb_alt</i>",
        "iconName": "do_disturb_alt",
        "iconCode": "0xe1e7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>do_disturb_off</i>",
        "iconName": "do_disturb_off",
        "iconCode": "0xe1e8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>do_disturb_on</i>",
        "iconName": "do_disturb_on",
        "iconCode": "0xe1e9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>do_not_disturb</i>",
        "iconName": "do_not_disturb",
        "iconCode": "0xe1ea"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>do_not_disturb_alt</i>",
        "iconName": "do_not_disturb_alt",
        "iconCode": "0xe1eb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>do_not_disturb_off</i>",
        "iconName": "do_not_disturb_off",
        "iconCode": "0xe1ec"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>do_not_disturb_on</i>",
        "iconName": "do_not_disturb_on",
        "iconCode": "0xe1ed"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>do_not_disturb_on_total_silence</i>",
        "iconName": "do_not_disturb_on_total_silence",
        "iconCode": "0xe1ee"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>do_not_step</i>",
        "iconName": "do_not_step",
        "iconCode": "0xe1ef"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>do_not_touch</i>",
        "iconName": "do_not_touch",
        "iconCode": "0xe1f0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dock</i>",
        "iconName": "dock",
        "iconCode": "0xe1f1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>document_scanner</i>",
        "iconName": "document_scanner",
        "iconCode": "0xe1f2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>domain</i>",
        "iconName": "domain",
        "iconCode": "0xe1f3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>domain_add</i>",
        "iconName": "domain_add",
        "iconCode": "0xf04f2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>domain_disabled</i>",
        "iconName": "domain_disabled",
        "iconCode": "0xe1f4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>domain_verification</i>",
        "iconName": "domain_verification",
        "iconCode": "0xe1f5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>done</i>",
        "iconName": "done",
        "iconCode": "0xe1f6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>done_all</i>",
        "iconName": "done_all",
        "iconCode": "0xe1f7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>done_outline</i>",
        "iconName": "done_outline",
        "iconCode": "0xe1f8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>donut_large</i>",
        "iconName": "donut_large",
        "iconCode": "0xe1f9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>donut_small</i>",
        "iconName": "donut_small",
        "iconCode": "0xe1fa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>door_back</i>",
        "iconName": "door_back_door",
        "iconCode": "0xe1fb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>door_front</i>",
        "iconName": "door_front_door",
        "iconCode": "0xe1fc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>door_sliding</i>",
        "iconName": "door_sliding",
        "iconCode": "0xe1fd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>doorbell</i>",
        "iconName": "doorbell",
        "iconCode": "0xe1fe"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>double_arrow</i>",
        "iconName": "double_arrow",
        "iconCode": "0xe1ff"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>downhill_skiing</i>",
        "iconName": "downhill_skiing",
        "iconCode": "0xe200"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>download</i>",
        "iconName": "download",
        "iconCode": "0xe201"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>download_done</i>",
        "iconName": "download_done",
        "iconCode": "0xe202"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>download_for_offline</i>",
        "iconName": "download_for_offline",
        "iconCode": "0xe203"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>downloading</i>",
        "iconName": "downloading",
        "iconCode": "0xe204"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>drafts</i>",
        "iconName": "drafts",
        "iconCode": "0xe205"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>drag_handle</i>",
        "iconName": "drag_handle",
        "iconCode": "0xe206"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>drag_indicator</i>",
        "iconName": "drag_indicator",
        "iconCode": "0xe207"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>draw</i>",
        "iconName": "draw",
        "iconCode": "0xf04f3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>drive_eta</i>",
        "iconName": "drive_eta",
        "iconCode": "0xe208"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>drive_file_move</i>",
        "iconName": "drive_file_move",
        "iconCode": "0xe209"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>drive_file_move_outline</i>",
        "iconName": "drive_file_move_outline",
        "iconCode": "0xe20a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>drive_file_move_rtl</i>",
        "iconName": "drive_file_move_rtl",
        "iconCode": "0xf04f4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>drive_file_rename_outline</i>",
        "iconName": "drive_file_rename_outline",
        "iconCode": "0xe20b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>drive_folder_upload</i>",
        "iconName": "drive_folder_upload",
        "iconCode": "0xe20c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dry</i>",
        "iconName": "dry",
        "iconCode": "0xe20d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dry_cleaning</i>",
        "iconName": "dry_cleaning",
        "iconCode": "0xe20e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>duo</i>",
        "iconName": "duo",
        "iconCode": "0xe20f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dvr</i>",
        "iconName": "dvr",
        "iconCode": "0xe210"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dynamic_feed</i>",
        "iconName": "dynamic_feed",
        "iconCode": "0xe211"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>dynamic_form</i>",
        "iconName": "dynamic_form",
        "iconCode": "0xe212"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>e_mobiledata</i>",
        "iconName": "e_mobiledata",
        "iconCode": "0xe213"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>earbuds</i>",
        "iconName": "earbuds",
        "iconCode": "0xe214"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>earbuds_battery</i>",
        "iconName": "earbuds_battery",
        "iconCode": "0xe215"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>east</i>",
        "iconName": "east",
        "iconCode": "0xe216"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>eco</i>",
        "iconName": "eco",
        "iconCode": "0xe217"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>edgesensor_high</i>",
        "iconName": "edgesensor_high",
        "iconCode": "0xe218"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>edgesensor_low</i>",
        "iconName": "edgesensor_low",
        "iconCode": "0xe219"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>edit</i>",
        "iconName": "edit",
        "iconCode": "0xe21a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>edit_attributes</i>",
        "iconName": "edit_attributes",
        "iconCode": "0xe21b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>edit_calendar</i>",
        "iconName": "edit_calendar",
        "iconCode": "0xf04f5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>edit_location</i>",
        "iconName": "edit_location",
        "iconCode": "0xe21c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>edit_location_alt</i>",
        "iconName": "edit_location_alt",
        "iconCode": "0xe21d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>edit_note</i>",
        "iconName": "edit_note",
        "iconCode": "0xf04f6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>edit_notifications</i>",
        "iconName": "edit_notifications",
        "iconCode": "0xe21e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>edit_off</i>",
        "iconName": "edit_off",
        "iconCode": "0xe21f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>edit_road</i>",
        "iconName": "edit_road",
        "iconCode": "0xe220"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>egg</i>",
        "iconName": "egg",
        "iconCode": "0xf04f8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>egg_alt</i>",
        "iconName": "egg_alt",
        "iconCode": "0xf04f7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>eject</i>",
        "iconName": "eject",
        "iconCode": "0xe221"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>elderly</i>",
        "iconName": "elderly",
        "iconCode": "0xe222"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>elderly_woman</i>",
        "iconName": "elderly_woman",
        "iconCode": "0xf04f9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>electric_bike</i>",
        "iconName": "electric_bike",
        "iconCode": "0xe223"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>electric_bolt</i>",
        "iconName": "electric_bolt",
        "iconCode": "0xf079c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>electric_car</i>",
        "iconName": "electric_car",
        "iconCode": "0xe224"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>electric_meter</i>",
        "iconName": "electric_meter",
        "iconCode": "0xf079d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>electric_moped</i>",
        "iconName": "electric_moped",
        "iconCode": "0xe225"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>electric_rickshaw</i>",
        "iconName": "electric_rickshaw",
        "iconCode": "0xe226"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>electric_scooter</i>",
        "iconName": "electric_scooter",
        "iconCode": "0xe227"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>electrical_services</i>",
        "iconName": "electrical_services",
        "iconCode": "0xe228"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>elevator</i>",
        "iconName": "elevator",
        "iconCode": "0xe229"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>email</i>",
        "iconName": "email",
        "iconCode": "0xe22a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>emergency</i>",
        "iconName": "emergency",
        "iconCode": "0xf04fa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>emergency_recording</i>",
        "iconName": "emergency_recording",
        "iconCode": "0xf079e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>emergency_share</i>",
        "iconName": "emergency_share",
        "iconCode": "0xf079f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>emoji_emotions</i>",
        "iconName": "emoji_emotions",
        "iconCode": "0xe22b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>emoji_events</i>",
        "iconName": "emoji_events",
        "iconCode": "0xe22c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>emoji_flags</i>",
        "iconName": "emoji_flags",
        "iconCode": "0xe22d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>emoji_food_beverage</i>",
        "iconName": "emoji_food_beverage",
        "iconCode": "0xe22e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>emoji_nature</i>",
        "iconName": "emoji_nature",
        "iconCode": "0xe22f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>emoji_objects</i>",
        "iconName": "emoji_objects",
        "iconCode": "0xe230"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>emoji_people</i>",
        "iconName": "emoji_people",
        "iconCode": "0xe231"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>emoji_symbols</i>",
        "iconName": "emoji_symbols",
        "iconCode": "0xe232"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>emoji_transportation</i>",
        "iconName": "emoji_transportation",
        "iconCode": "0xe233"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>energy_savings_leaf</i>",
        "iconName": "energy_savings_leaf",
        "iconCode": "0xf07a0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>engineering</i>",
        "iconName": "engineering",
        "iconCode": "0xe234"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>enhance_photo_translate</i>",
        "iconName": "enhance_photo_translate",
        "iconCode": "0xe131"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>enhanced_encryption</i>",
        "iconName": "enhanced_encryption",
        "iconCode": "0xe235"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>equalizer</i>",
        "iconName": "equalizer",
        "iconCode": "0xe236"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>error</i>",
        "iconName": "error",
        "iconCode": "0xe237"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>error_outline</i>",
        "iconName": "error_outline",
        "iconCode": "0xe238"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>escalator</i>",
        "iconName": "escalator",
        "iconCode": "0xe239"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>escalator_warning</i>",
        "iconName": "escalator_warning",
        "iconCode": "0xe23a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>euro</i>",
        "iconName": "euro",
        "iconCode": "0xe23b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>euro_symbol</i>",
        "iconName": "euro_symbol",
        "iconCode": "0xe23c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>ev_station</i>",
        "iconName": "ev_station",
        "iconCode": "0xe23d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>event</i>",
        "iconName": "event",
        "iconCode": "0xe23e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>event_available</i>",
        "iconName": "event_available",
        "iconCode": "0xe23f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>event_busy</i>",
        "iconName": "event_busy",
        "iconCode": "0xe240"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>event_note</i>",
        "iconName": "event_note",
        "iconCode": "0xe241"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>event_repeat</i>",
        "iconName": "event_repeat",
        "iconCode": "0xf04fb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>event_seat</i>",
        "iconName": "event_seat",
        "iconCode": "0xe242"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>exit_to_app</i>",
        "iconName": "exit_to_app",
        "iconCode": "0xe243"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>expand</i>",
        "iconName": "expand",
        "iconCode": "0xe244"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>expand_circle_down</i>",
        "iconName": "expand_circle_down",
        "iconCode": "0xf04fc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>expand_less</i>",
        "iconName": "expand_less",
        "iconCode": "0xe245"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>expand_more</i>",
        "iconName": "expand_more",
        "iconCode": "0xe246"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>explicit</i>",
        "iconName": "explicit",
        "iconCode": "0xe247"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>explore</i>",
        "iconName": "explore",
        "iconCode": "0xe248"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>explore_off</i>",
        "iconName": "explore_off",
        "iconCode": "0xe249"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>exposure</i>",
        "iconName": "exposure",
        "iconCode": "0xe24a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>exposure_minus_1</i>",
        "iconName": "exposure_minus_1",
        "iconCode": "0xe24b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>exposure_minus_2</i>",
        "iconName": "exposure_minus_2",
        "iconCode": "0xe24c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>exposure_neg_1</i>",
        "iconName": "exposure_neg_1",
        "iconCode": "0xe24b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>exposure_neg_2</i>",
        "iconName": "exposure_neg_2",
        "iconCode": "0xe24c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>exposure_plus_1</i>",
        "iconName": "exposure_plus_1",
        "iconCode": "0xe24d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>exposure_plus_2</i>",
        "iconName": "exposure_plus_2",
        "iconCode": "0xe24e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>exposure_zero</i>",
        "iconName": "exposure_zero",
        "iconCode": "0xe24f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>extension</i>",
        "iconName": "extension",
        "iconCode": "0xe250"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>extension_off</i>",
        "iconName": "extension_off",
        "iconCode": "0xe251"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>face</i>",
        "iconName": "face",
        "iconCode": "0xe252"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>face_retouching_natural</i>",
        "iconName": "face_retouching_natural",
        "iconCode": "0xe253"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>face_retouching_off</i>",
        "iconName": "face_retouching_off",
        "iconCode": "0xe254"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>facebook</i>",
        "iconName": "facebook",
        "iconCode": "0xe255"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fact_check</i>",
        "iconName": "fact_check",
        "iconCode": "0xe256"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>factory</i>",
        "iconName": "factory",
        "iconCode": "0xf04fd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>family_restroom</i>",
        "iconName": "family_restroom",
        "iconCode": "0xe257"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fast_forward</i>",
        "iconName": "fast_forward",
        "iconCode": "0xe258"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fast_rewind</i>",
        "iconName": "fast_rewind",
        "iconCode": "0xe259"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fastfood</i>",
        "iconName": "fastfood",
        "iconCode": "0xe25a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>favorite</i>",
        "iconName": "favorite",
        "iconCode": "0xe25b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>favorite_border</i>",
        "iconName": "favorite_border",
        "iconCode": "0xe25c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>favorite_outline</i>",
        "iconName": "favorite_outline",
        "iconCode": "0xe25c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fax</i>",
        "iconName": "fax",
        "iconCode": "0xf04fe"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>featured_play_list</i>",
        "iconName": "featured_play_list",
        "iconCode": "0xe25d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>featured_video</i>",
        "iconName": "featured_video",
        "iconCode": "0xe25e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>feed</i>",
        "iconName": "feed",
        "iconCode": "0xe25f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>feedback</i>",
        "iconName": "feedback",
        "iconCode": "0xe260"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>female</i>",
        "iconName": "female",
        "iconCode": "0xe261"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fence</i>",
        "iconName": "fence",
        "iconCode": "0xe262"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>festival</i>",
        "iconName": "festival",
        "iconCode": "0xe263"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fiber_dvr</i>",
        "iconName": "fiber_dvr",
        "iconCode": "0xe264"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fiber_manual_record</i>",
        "iconName": "fiber_manual_record",
        "iconCode": "0xe265"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fiber_new</i>",
        "iconName": "fiber_new",
        "iconCode": "0xe266"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fiber_pin</i>",
        "iconName": "fiber_pin",
        "iconCode": "0xe267"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fiber_smart_record</i>",
        "iconName": "fiber_smart_record",
        "iconCode": "0xe268"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>file_copy</i>",
        "iconName": "file_copy",
        "iconCode": "0xe269"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>file_download</i>",
        "iconName": "file_download",
        "iconCode": "0xe26a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>file_download_done</i>",
        "iconName": "file_download_done",
        "iconCode": "0xe26b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>file_download_off</i>",
        "iconName": "file_download_off",
        "iconCode": "0xe26c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>file_open</i>",
        "iconName": "file_open",
        "iconCode": "0xf04ff"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>file_present</i>",
        "iconName": "file_present",
        "iconCode": "0xe26d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>file_upload</i>",
        "iconName": "file_upload",
        "iconCode": "0xe26e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter</i>",
        "iconName": "filter",
        "iconCode": "0xe26f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_1</i>",
        "iconName": "filter_1",
        "iconCode": "0xe270"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_2</i>",
        "iconName": "filter_2",
        "iconCode": "0xe271"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_3</i>",
        "iconName": "filter_3",
        "iconCode": "0xe272"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_4</i>",
        "iconName": "filter_4",
        "iconCode": "0xe273"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_5</i>",
        "iconName": "filter_5",
        "iconCode": "0xe274"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_6</i>",
        "iconName": "filter_6",
        "iconCode": "0xe275"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_7</i>",
        "iconName": "filter_7",
        "iconCode": "0xe276"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_8</i>",
        "iconName": "filter_8",
        "iconCode": "0xe277"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_9</i>",
        "iconName": "filter_9",
        "iconCode": "0xe278"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_9_plus</i>",
        "iconName": "filter_9_plus",
        "iconCode": "0xe279"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_alt_outlined</i>",
        "iconName": "filter_alt_outlined",
        "iconCode": "0xe27a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_alt_outlined_off</i>",
        "iconName": "filter_alt_outlined_off",
        "iconCode": "0xf0500"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_b_and_w</i>",
        "iconName": "filter_b_and_w",
        "iconCode": "0xe27b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_center_focus</i>",
        "iconName": "filter_center_focus",
        "iconCode": "0xe27c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_drama</i>",
        "iconName": "filter_drama",
        "iconCode": "0xe27d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_frames</i>",
        "iconName": "filter_frames",
        "iconCode": "0xe27e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_hdr</i>",
        "iconName": "filter_hdr",
        "iconCode": "0xe27f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_list</i>",
        "iconName": "filter_list",
        "iconCode": "0xe280"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_list_alt</i>",
        "iconName": "filter_list_alt",
        "iconCode": "0xe281"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_list_off</i>",
        "iconName": "filter_list_off",
        "iconCode": "0xf0501"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_none</i>",
        "iconName": "filter_none",
        "iconCode": "0xe282"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_tilt_shift</i>",
        "iconName": "filter_tilt_shift",
        "iconCode": "0xe283"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>filter_vintage</i>",
        "iconName": "filter_vintage",
        "iconCode": "0xe284"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>find_in_page</i>",
        "iconName": "find_in_page",
        "iconCode": "0xe285"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>find_replace</i>",
        "iconName": "find_replace",
        "iconCode": "0xe286"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fingerprint</i>",
        "iconName": "fingerprint",
        "iconCode": "0xe287"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fire_extinguisher</i>",
        "iconName": "fire_extinguisher",
        "iconCode": "0xe288"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fire_hydrant</i>",
        "iconName": "fire_hydrant",
        "iconCode": "0xe289"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fire_hydrant_alt</i>",
        "iconName": "fire_hydrant_alt",
        "iconCode": "0xf07a1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fire_truck</i>",
        "iconName": "fire_truck",
        "iconCode": "0xf07a2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fireplace</i>",
        "iconName": "fireplace",
        "iconCode": "0xe28a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>first_page</i>",
        "iconName": "first_page",
        "iconCode": "0xe28b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fit_screen</i>",
        "iconName": "fit_screen",
        "iconCode": "0xe28c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fitbit</i>",
        "iconName": "fitbit",
        "iconCode": "0xf0502"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fitness_center</i>",
        "iconName": "fitness_center",
        "iconCode": "0xe28d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flag</i>",
        "iconName": "flag",
        "iconCode": "0xe28e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flag_circle</i>",
        "iconName": "flag_circle",
        "iconCode": "0xf0503"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flaky</i>",
        "iconName": "flaky",
        "iconCode": "0xe28f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flare</i>",
        "iconName": "flare",
        "iconCode": "0xe290"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flash_auto</i>",
        "iconName": "flash_auto",
        "iconCode": "0xe291"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flash_off</i>",
        "iconName": "flash_off",
        "iconCode": "0xe292"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flash_on</i>",
        "iconName": "flash_on",
        "iconCode": "0xe293"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flashlight_off</i>",
        "iconName": "flashlight_off",
        "iconCode": "0xe294"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flashlight_on</i>",
        "iconName": "flashlight_on",
        "iconCode": "0xe295"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flatware</i>",
        "iconName": "flatware",
        "iconCode": "0xe296"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flight</i>",
        "iconName": "flight",
        "iconCode": "0xe297"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flight_class</i>",
        "iconName": "flight_class",
        "iconCode": "0xf0504"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flight_land</i>",
        "iconName": "flight_land",
        "iconCode": "0xe298"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flight_takeoff</i>",
        "iconName": "flight_takeoff",
        "iconCode": "0xe299"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flip</i>",
        "iconName": "flip",
        "iconCode": "0xe29a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flip_camera_android</i>",
        "iconName": "flip_camera_android",
        "iconCode": "0xe29b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flip_camera_ios</i>",
        "iconName": "flip_camera_ios",
        "iconCode": "0xe29c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flip_to_back</i>",
        "iconName": "flip_to_back",
        "iconCode": "0xe29d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flip_to_front</i>",
        "iconName": "flip_to_front",
        "iconCode": "0xe29e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flood</i>",
        "iconName": "flood",
        "iconCode": "0xf07a3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flourescent</i>",
        "iconName": "flourescent",
        "iconCode": "0xe29f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>flutter_dash</i>",
        "iconName": "flutter_dash",
        "iconCode": "0xe2a0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fmd_bad</i>",
        "iconName": "fmd_bad",
        "iconCode": "0xe2a1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fmd_good</i>",
        "iconName": "fmd_good",
        "iconCode": "0xe2a2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>foggy</i>",
        "iconName": "foggy",
        "iconCode": "0xf0505"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>folder</i>",
        "iconName": "folder",
        "iconCode": "0xe2a3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>folder_copy</i>",
        "iconName": "folder_copy",
        "iconCode": "0xf0506"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>folder_delete</i>",
        "iconName": "folder_delete",
        "iconCode": "0xf0507"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>folder_off</i>",
        "iconName": "folder_off",
        "iconCode": "0xf0508"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>folder_open</i>",
        "iconName": "folder_open",
        "iconCode": "0xe2a4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>folder_shared</i>",
        "iconName": "folder_shared",
        "iconCode": "0xe2a5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>folder_special</i>",
        "iconName": "folder_special",
        "iconCode": "0xe2a6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>folder_zip</i>",
        "iconName": "folder_zip",
        "iconCode": "0xf0509"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>follow_the_signs</i>",
        "iconName": "follow_the_signs",
        "iconCode": "0xe2a7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>font_download</i>",
        "iconName": "font_download",
        "iconCode": "0xe2a8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>font_download_off</i>",
        "iconName": "font_download_off",
        "iconCode": "0xe2a9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>food_bank</i>",
        "iconName": "food_bank",
        "iconCode": "0xe2aa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>forest</i>",
        "iconName": "forest",
        "iconCode": "0xf050a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fork_left</i>",
        "iconName": "fork_left",
        "iconCode": "0xf050b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fork_right</i>",
        "iconName": "fork_right",
        "iconCode": "0xf050c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_align_center</i>",
        "iconName": "format_align_center",
        "iconCode": "0xe2ab"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_align_justify</i>",
        "iconName": "format_align_justify",
        "iconCode": "0xe2ac"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_align_left</i>",
        "iconName": "format_align_left",
        "iconCode": "0xe2ad"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_align_right</i>",
        "iconName": "format_align_right",
        "iconCode": "0xe2ae"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_bold</i>",
        "iconName": "format_bold",
        "iconCode": "0xe2af"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_clear</i>",
        "iconName": "format_clear",
        "iconCode": "0xe2b0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_color_fill</i>",
        "iconName": "format_color_fill",
        "iconCode": "0xe2b1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_color_reset</i>",
        "iconName": "format_color_reset",
        "iconCode": "0xe2b2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_color_text</i>",
        "iconName": "format_color_text",
        "iconCode": "0xe2b3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_indent_decrease</i>",
        "iconName": "format_indent_decrease",
        "iconCode": "0xe2b4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_indent_increase</i>",
        "iconName": "format_indent_increase",
        "iconCode": "0xe2b5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_italic</i>",
        "iconName": "format_italic",
        "iconCode": "0xe2b6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_line_spacing</i>",
        "iconName": "format_line_spacing",
        "iconCode": "0xe2b7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_list_bulleted</i>",
        "iconName": "format_list_bulleted",
        "iconCode": "0xe2b8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_list_numbered</i>",
        "iconName": "format_list_numbered",
        "iconCode": "0xe2b9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_list_numbered_rtl</i>",
        "iconName": "format_list_numbered_rtl",
        "iconCode": "0xe2ba"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_overline</i>",
        "iconName": "format_overline",
        "iconCode": "0xf050d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_paint</i>",
        "iconName": "format_paint",
        "iconCode": "0xe2bb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_quote</i>",
        "iconName": "format_quote",
        "iconCode": "0xe2bc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_shapes</i>",
        "iconName": "format_shapes",
        "iconCode": "0xe2bd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_size</i>",
        "iconName": "format_size",
        "iconCode": "0xe2be"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_strikethrough</i>",
        "iconName": "format_strikethrough",
        "iconCode": "0xe2bf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_textdirection_l_to_r</i>",
        "iconName": "format_textdirection_l_to_r",
        "iconCode": "0xe2c0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_textdirection_r_to_l</i>",
        "iconName": "format_textdirection_r_to_l",
        "iconCode": "0xe2c1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_underline</i>",
        "iconName": "format_underline",
        "iconCode": "0xe2c2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>format_underlined</i>",
        "iconName": "format_underlined",
        "iconCode": "0xe2c2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fort</i>",
        "iconName": "fort",
        "iconCode": "0xf050e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>forum</i>",
        "iconName": "forum",
        "iconCode": "0xe2c3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>forward</i>",
        "iconName": "forward",
        "iconCode": "0xe2c4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>forward_10</i>",
        "iconName": "forward_10",
        "iconCode": "0xe2c5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>forward_30</i>",
        "iconName": "forward_30",
        "iconCode": "0xe2c6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>forward_5</i>",
        "iconName": "forward_5",
        "iconCode": "0xe2c7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>forward_to_inbox</i>",
        "iconName": "forward_to_inbox",
        "iconCode": "0xe2c8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>foundation</i>",
        "iconName": "foundation",
        "iconCode": "0xe2c9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>free_breakfast</i>",
        "iconName": "free_breakfast",
        "iconCode": "0xe2ca"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>free_cancellation</i>",
        "iconName": "free_cancellation",
        "iconCode": "0xf050f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>front_hand</i>",
        "iconName": "front_hand",
        "iconCode": "0xf0510"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fullscreen</i>",
        "iconName": "fullscreen",
        "iconCode": "0xe2cb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>fullscreen_exit</i>",
        "iconName": "fullscreen_exit",
        "iconCode": "0xe2cc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>functions</i>",
        "iconName": "functions",
        "iconCode": "0xe2cd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>g_mobiledata</i>",
        "iconName": "g_mobiledata",
        "iconCode": "0xe2ce"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>g_translate</i>",
        "iconName": "g_translate",
        "iconCode": "0xe2cf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>gamepad</i>",
        "iconName": "gamepad",
        "iconCode": "0xe2d0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>games</i>",
        "iconName": "games",
        "iconCode": "0xe2d1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>garage</i>",
        "iconName": "garage",
        "iconCode": "0xe2d2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>gas_meter</i>",
        "iconName": "gas_meter",
        "iconCode": "0xf07a4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>gavel</i>",
        "iconName": "gavel",
        "iconCode": "0xe2d3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>generating_tokens</i>",
        "iconName": "generating_tokens",
        "iconCode": "0xf0511"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>gesture</i>",
        "iconName": "gesture",
        "iconCode": "0xe2d4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>get_app</i>",
        "iconName": "get_app",
        "iconCode": "0xe2d5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>gif</i>",
        "iconName": "gif",
        "iconCode": "0xe2d6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>gif_box</i>",
        "iconName": "gif_box",
        "iconCode": "0xf0512"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>girl</i>",
        "iconName": "girl",
        "iconCode": "0xf0513"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>gite</i>",
        "iconName": "gite",
        "iconCode": "0xe2d7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>golf_course</i>",
        "iconName": "golf_course",
        "iconCode": "0xe2d8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>gpp_bad</i>",
        "iconName": "gpp_bad",
        "iconCode": "0xe2d9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>gpp_good</i>",
        "iconName": "gpp_good",
        "iconCode": "0xe2da"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>gpp_maybe</i>",
        "iconName": "gpp_maybe",
        "iconCode": "0xe2db"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>gps_fixed</i>",
        "iconName": "gps_fixed",
        "iconCode": "0xe2dc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>gps_not_fixed</i>",
        "iconName": "gps_not_fixed",
        "iconCode": "0xe2dd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>gps_off</i>",
        "iconName": "gps_off",
        "iconCode": "0xe2de"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>grade</i>",
        "iconName": "grade",
        "iconCode": "0xe2df"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>gradient</i>",
        "iconName": "gradient",
        "iconCode": "0xe2e0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>grading</i>",
        "iconName": "grading",
        "iconCode": "0xe2e1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>grain</i>",
        "iconName": "grain",
        "iconCode": "0xe2e2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>graphic_eq</i>",
        "iconName": "graphic_eq",
        "iconCode": "0xe2e3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>grass</i>",
        "iconName": "grass",
        "iconCode": "0xe2e4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>grid_3x3</i>",
        "iconName": "grid_3x3",
        "iconCode": "0xe2e5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>grid_4x4</i>",
        "iconName": "grid_4x4",
        "iconCode": "0xe2e6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>grid_goldenratio</i>",
        "iconName": "grid_goldenratio",
        "iconCode": "0xe2e7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>grid_off</i>",
        "iconName": "grid_off",
        "iconCode": "0xe2e8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>grid_on</i>",
        "iconName": "grid_on",
        "iconCode": "0xe2e9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>grid_view</i>",
        "iconName": "grid_view",
        "iconCode": "0xe2ea"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>group</i>",
        "iconName": "group",
        "iconCode": "0xe2eb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>group_add</i>",
        "iconName": "group_add",
        "iconCode": "0xe2ec"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>group_off</i>",
        "iconName": "group_off",
        "iconCode": "0xf0514"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>group_remove</i>",
        "iconName": "group_remove",
        "iconCode": "0xf0515"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>group_work</i>",
        "iconName": "group_work",
        "iconCode": "0xe2ed"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>groups</i>",
        "iconName": "groups",
        "iconCode": "0xe2ee"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>h_mobiledata</i>",
        "iconName": "h_mobiledata",
        "iconCode": "0xe2ef"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>h_plus_mobiledata</i>",
        "iconName": "h_plus_mobiledata",
        "iconCode": "0xe2f0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hail</i>",
        "iconName": "hail",
        "iconCode": "0xe2f1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>handshake</i>",
        "iconName": "handshake",
        "iconCode": "0xf06be"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>handyman</i>",
        "iconName": "handyman",
        "iconCode": "0xe2f2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hardware</i>",
        "iconName": "hardware",
        "iconCode": "0xe2f3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hd</i>",
        "iconName": "hd",
        "iconCode": "0xe2f4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hdr_auto</i>",
        "iconName": "hdr_auto",
        "iconCode": "0xe2f5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hdr_auto_select</i>",
        "iconName": "hdr_auto_select",
        "iconCode": "0xe2f6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hdr_enhanced_select</i>",
        "iconName": "hdr_enhanced_select",
        "iconCode": "0xe2f7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hdr_off</i>",
        "iconName": "hdr_off",
        "iconCode": "0xe2f8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hdr_off_select</i>",
        "iconName": "hdr_off_select",
        "iconCode": "0xe2f9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hdr_on</i>",
        "iconName": "hdr_on",
        "iconCode": "0xe2fa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hdr_on_select</i>",
        "iconName": "hdr_on_select",
        "iconCode": "0xe2fb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hdr_plus</i>",
        "iconName": "hdr_plus",
        "iconCode": "0xe2fc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hdr_strong</i>",
        "iconName": "hdr_strong",
        "iconCode": "0xe2fd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hdr_weak</i>",
        "iconName": "hdr_weak",
        "iconCode": "0xe2fe"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>headphones</i>",
        "iconName": "headphones",
        "iconCode": "0xe2ff"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>headphones_battery</i>",
        "iconName": "headphones_battery",
        "iconCode": "0xe300"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>headset</i>",
        "iconName": "headset",
        "iconCode": "0xe301"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>headset_mic</i>",
        "iconName": "headset_mic",
        "iconCode": "0xe302"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>headset_off</i>",
        "iconName": "headset_off",
        "iconCode": "0xe303"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>healing</i>",
        "iconName": "healing",
        "iconCode": "0xe304"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>health_and_safety</i>",
        "iconName": "health_and_safety",
        "iconCode": "0xe305"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hearing</i>",
        "iconName": "hearing",
        "iconCode": "0xe306"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hearing_disabled</i>",
        "iconName": "hearing_disabled",
        "iconCode": "0xe307"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>heart_broken</i>",
        "iconName": "heart_broken",
        "iconCode": "0xf0516"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>heat_pump</i>",
        "iconName": "heat_pump",
        "iconCode": "0xf07a5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>height</i>",
        "iconName": "height",
        "iconCode": "0xe308"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>help</i>",
        "iconName": "help",
        "iconCode": "0xe309"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>help_center</i>",
        "iconName": "help_center",
        "iconCode": "0xe30a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>help_outline</i>",
        "iconName": "help_outline",
        "iconCode": "0xe30b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hevc</i>",
        "iconName": "hevc",
        "iconCode": "0xe30c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hexagon</i>",
        "iconName": "hexagon",
        "iconCode": "0xf0517"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hide_image</i>",
        "iconName": "hide_image",
        "iconCode": "0xe30d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hide_source</i>",
        "iconName": "hide_source",
        "iconCode": "0xe30e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>high_quality</i>",
        "iconName": "high_quality",
        "iconCode": "0xe30f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>highlight</i>",
        "iconName": "highlight",
        "iconCode": "0xe310"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>highlight_alt</i>",
        "iconName": "highlight_alt",
        "iconCode": "0xe311"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>highlight_off</i>",
        "iconName": "highlight_off",
        "iconCode": "0xe312"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>highlight_remove</i>",
        "iconName": "highlight_remove",
        "iconCode": "0xe312"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hiking</i>",
        "iconName": "hiking",
        "iconCode": "0xe313"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>history</i>",
        "iconName": "history",
        "iconCode": "0xe314"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>history_edu</i>",
        "iconName": "history_edu",
        "iconCode": "0xe315"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>history_toggle_off</i>",
        "iconName": "history_toggle_off",
        "iconCode": "0xe316"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hive</i>",
        "iconName": "hive",
        "iconCode": "0xf0518"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hls</i>",
        "iconName": "hls",
        "iconCode": "0xf0519"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hls_off</i>",
        "iconName": "hls_off",
        "iconCode": "0xf051a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>holiday_village</i>",
        "iconName": "holiday_village",
        "iconCode": "0xe317"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>home</i>",
        "iconName": "home",
        "iconCode": "0xe318"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>home_filled</i>",
        "iconName": "home_filled",
        "iconCode": "0xe319"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>home_max</i>",
        "iconName": "home_max",
        "iconCode": "0xe31a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>home_mini</i>",
        "iconName": "home_mini",
        "iconCode": "0xe31b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>home_repair_service</i>",
        "iconName": "home_repair_service",
        "iconCode": "0xe31c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>home_work</i>",
        "iconName": "home_work",
        "iconCode": "0xe31d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>horizontal_distribute</i>",
        "iconName": "horizontal_distribute",
        "iconCode": "0xe31e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>horizontal_rule</i>",
        "iconName": "horizontal_rule",
        "iconCode": "0xe31f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>horizontal_split</i>",
        "iconName": "horizontal_split",
        "iconCode": "0xe320"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hot_tub</i>",
        "iconName": "hot_tub",
        "iconCode": "0xe321"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hotel</i>",
        "iconName": "hotel",
        "iconCode": "0xe322"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hotel_class</i>",
        "iconName": "hotel_class",
        "iconCode": "0xf051b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hourglass_bottom</i>",
        "iconName": "hourglass_bottom",
        "iconCode": "0xe323"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hourglass_disabled</i>",
        "iconName": "hourglass_disabled",
        "iconCode": "0xe324"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hourglass_empty</i>",
        "iconName": "hourglass_empty",
        "iconCode": "0xe325"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hourglass_full</i>",
        "iconName": "hourglass_full",
        "iconCode": "0xe326"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hourglass_top</i>",
        "iconName": "hourglass_top",
        "iconCode": "0xe327"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>house</i>",
        "iconName": "house",
        "iconCode": "0xe328"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>house_siding</i>",
        "iconName": "house_siding",
        "iconCode": "0xe329"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>houseboat</i>",
        "iconName": "houseboat",
        "iconCode": "0xe32a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>how_to_reg</i>",
        "iconName": "how_to_reg",
        "iconCode": "0xe32b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>how_to_vote</i>",
        "iconName": "how_to_vote",
        "iconCode": "0xe32c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>html</i>",
        "iconName": "html",
        "iconCode": "0xf051c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>http</i>",
        "iconName": "http",
        "iconCode": "0xe32d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>https</i>",
        "iconName": "https",
        "iconCode": "0xe32e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hub</i>",
        "iconName": "hub",
        "iconCode": "0xf051d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>hvac</i>",
        "iconName": "hvac",
        "iconCode": "0xe32f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>ice_skating</i>",
        "iconName": "ice_skating",
        "iconCode": "0xe330"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>icecream</i>",
        "iconName": "icecream",
        "iconCode": "0xe331"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>image</i>",
        "iconName": "image",
        "iconCode": "0xe332"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>image_aspect_ratio</i>",
        "iconName": "image_aspect_ratio",
        "iconCode": "0xe333"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>image_not_supported</i>",
        "iconName": "image_not_supported",
        "iconCode": "0xe334"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>image_search</i>",
        "iconName": "image_search",
        "iconCode": "0xe335"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>imagesearch_roller</i>",
        "iconName": "imagesearch_roller",
        "iconCode": "0xe336"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>import_contacts</i>",
        "iconName": "import_contacts",
        "iconCode": "0xe337"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>import_export</i>",
        "iconName": "import_export",
        "iconCode": "0xe338"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>important_devices</i>",
        "iconName": "important_devices",
        "iconCode": "0xe339"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>inbox</i>",
        "iconName": "inbox",
        "iconCode": "0xe33a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>incomplete_circle</i>",
        "iconName": "incomplete_circle",
        "iconCode": "0xf051e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>indeterminate_check_box</i>",
        "iconName": "indeterminate_check_box",
        "iconCode": "0xe33b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>info</i>",
        "iconName": "info",
        "iconCode": "0xe33c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>info_outline</i>",
        "iconName": "info_outline",
        "iconCode": "0xe33d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>insert_chart</i>",
        "iconName": "insert_chart",
        "iconCode": "0xe33f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>insert_comment</i>",
        "iconName": "insert_comment",
        "iconCode": "0xe341"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>insert_drive_file</i>",
        "iconName": "insert_drive_file",
        "iconCode": "0xe342"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>insert_emoticon</i>",
        "iconName": "insert_emoticon",
        "iconCode": "0xe343"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>insert_invitation</i>",
        "iconName": "insert_invitation",
        "iconCode": "0xe344"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>insert_link</i>",
        "iconName": "insert_link",
        "iconCode": "0xe345"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>insert_page_break</i>",
        "iconName": "insert_page_break",
        "iconCode": "0xf0520"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>insert_photo</i>",
        "iconName": "insert_photo",
        "iconCode": "0xe346"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>insights</i>",
        "iconName": "insights",
        "iconCode": "0xe347"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>install_desktop</i>",
        "iconName": "install_desktop",
        "iconCode": "0xf0521"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>install_mobile</i>",
        "iconName": "install_mobile",
        "iconCode": "0xf0522"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>integration_instructions</i>",
        "iconName": "integration_instructions",
        "iconCode": "0xe348"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>interests</i>",
        "iconName": "interests",
        "iconCode": "0xf0523"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>interpreter_mode</i>",
        "iconName": "interpreter_mode",
        "iconCode": "0xf0524"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>inventory</i>",
        "iconName": "inventory",
        "iconCode": "0xe349"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>inventory_2</i>",
        "iconName": "inventory_2",
        "iconCode": "0xe34a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>invert_colors</i>",
        "iconName": "invert_colors",
        "iconCode": "0xe34b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>invert_colors_off</i>",
        "iconName": "invert_colors_off",
        "iconCode": "0xe34c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>invert_colors_on</i>",
        "iconName": "invert_colors_on",
        "iconCode": "0xe34b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>ios_share</i>",
        "iconName": "ios_share",
        "iconCode": "0xe34d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>iron</i>",
        "iconName": "iron",
        "iconCode": "0xe34e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>iso</i>",
        "iconName": "iso",
        "iconCode": "0xe34f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>javascript</i>",
        "iconName": "javascript",
        "iconCode": "0xf0525"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>join_full</i>",
        "iconName": "join_full",
        "iconCode": "0xf0526"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>join_inner</i>",
        "iconName": "join_inner",
        "iconCode": "0xf0527"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>join_left</i>",
        "iconName": "join_left",
        "iconCode": "0xf0528"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>join_right</i>",
        "iconName": "join_right",
        "iconCode": "0xf0529"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>kayaking</i>",
        "iconName": "kayaking",
        "iconCode": "0xe350"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>kebab_dining</i>",
        "iconName": "kebab_dining",
        "iconCode": "0xf052a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>key</i>",
        "iconName": "key",
        "iconCode": "0xf052b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>key_off</i>",
        "iconName": "key_off",
        "iconCode": "0xf052c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard</i>",
        "iconName": "keyboard",
        "iconCode": "0xe351"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_alt</i>",
        "iconName": "keyboard_alt",
        "iconCode": "0xe352"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_arrow_down</i>",
        "iconName": "keyboard_arrow_down",
        "iconCode": "0xe353"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_arrow_left</i>",
        "iconName": "keyboard_arrow_left",
        "iconCode": "0xe354"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_arrow_right</i>",
        "iconName": "keyboard_arrow_right",
        "iconCode": "0xe355"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_arrow_up</i>",
        "iconName": "keyboard_arrow_up",
        "iconCode": "0xe356"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_backspace</i>",
        "iconName": "keyboard_backspace",
        "iconCode": "0xe357"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_capslock</i>",
        "iconName": "keyboard_capslock",
        "iconCode": "0xe358"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_command_key</i>",
        "iconName": "keyboard_command_key",
        "iconCode": "0xf052d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_control</i>",
        "iconName": "keyboard_control",
        "iconCode": "0xe402"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_control_key</i>",
        "iconName": "keyboard_control_key",
        "iconCode": "0xf052e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_double_arrow_down</i>",
        "iconName": "keyboard_double_arrow_down",
        "iconCode": "0xf052f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_double_arrow_left</i>",
        "iconName": "keyboard_double_arrow_left",
        "iconCode": "0xf0530"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_double_arrow_right</i>",
        "iconName": "keyboard_double_arrow_right",
        "iconCode": "0xf0531"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_double_arrow_up</i>",
        "iconName": "keyboard_double_arrow_up",
        "iconCode": "0xf0532"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_hide</i>",
        "iconName": "keyboard_hide",
        "iconCode": "0xe359"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_option_key</i>",
        "iconName": "keyboard_option_key",
        "iconCode": "0xf0533"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_return</i>",
        "iconName": "keyboard_return",
        "iconCode": "0xe35a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_tab</i>",
        "iconName": "keyboard_tab",
        "iconCode": "0xe35b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>keyboard_voice</i>",
        "iconName": "keyboard_voice",
        "iconCode": "0xe35c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>king_bed</i>",
        "iconName": "king_bed",
        "iconCode": "0xe35d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>kitchen</i>",
        "iconName": "kitchen",
        "iconCode": "0xe35e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>kitesurfing</i>",
        "iconName": "kitesurfing",
        "iconCode": "0xe35f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>label</i>",
        "iconName": "label",
        "iconCode": "0xe360"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>label_important</i>",
        "iconName": "label_important",
        "iconCode": "0xe361"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>label_important_outline</i>",
        "iconName": "label_important_outline",
        "iconCode": "0xe362"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>label_outline</i>",
        "iconName": "label_outline",
        "iconCode": "0xe364"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>landscape</i>",
        "iconName": "landscape",
        "iconCode": "0xe365"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>landslide</i>",
        "iconName": "landslide",
        "iconCode": "0xf07a6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>language</i>",
        "iconName": "language",
        "iconCode": "0xe366"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>laptop</i>",
        "iconName": "laptop",
        "iconCode": "0xe367"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>laptop_chromebook</i>",
        "iconName": "laptop_chromebook",
        "iconCode": "0xe368"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>laptop_mac</i>",
        "iconName": "laptop_mac",
        "iconCode": "0xe369"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>laptop_windows</i>",
        "iconName": "laptop_windows",
        "iconCode": "0xe36a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>last_page</i>",
        "iconName": "last_page",
        "iconCode": "0xe36b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>launch</i>",
        "iconName": "launch",
        "iconCode": "0xe36c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>layers</i>",
        "iconName": "layers",
        "iconCode": "0xe36d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>layers_clear</i>",
        "iconName": "layers_clear",
        "iconCode": "0xe36e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>leaderboard</i>",
        "iconName": "leaderboard",
        "iconCode": "0xe36f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>leak_add</i>",
        "iconName": "leak_add",
        "iconCode": "0xe370"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>leak_remove</i>",
        "iconName": "leak_remove",
        "iconCode": "0xe371"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>leave_bags_at_home</i>",
        "iconName": "leave_bags_at_home",
        "iconCode": "0xe439"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>legend_toggle</i>",
        "iconName": "legend_toggle",
        "iconCode": "0xe372"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>lens</i>",
        "iconName": "lens",
        "iconCode": "0xe373"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>lens_blur</i>",
        "iconName": "lens_blur",
        "iconCode": "0xe374"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>library_add</i>",
        "iconName": "library_add",
        "iconCode": "0xe375"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>library_add_check</i>",
        "iconName": "library_add_check",
        "iconCode": "0xe376"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>library_books</i>",
        "iconName": "library_books",
        "iconCode": "0xe377"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>library_music</i>",
        "iconName": "library_music",
        "iconCode": "0xe378"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>light</i>",
        "iconName": "light",
        "iconCode": "0xe379"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>light_mode</i>",
        "iconName": "light_mode",
        "iconCode": "0xe37a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>lightbulb</i>",
        "iconName": "lightbulb",
        "iconCode": "0xe37b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>lightbulb_circle</i>",
        "iconName": "lightbulb_circle",
        "iconCode": "0xf07a7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>lightbulb_outline</i>",
        "iconName": "lightbulb_outline",
        "iconCode": "0xe37c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>line_style</i>",
        "iconName": "line_style",
        "iconCode": "0xe37d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>line_weight</i>",
        "iconName": "line_weight",
        "iconCode": "0xe37e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>linear_scale</i>",
        "iconName": "linear_scale",
        "iconCode": "0xe37f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>link</i>",
        "iconName": "link",
        "iconCode": "0xe380"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>link_off</i>",
        "iconName": "link_off",
        "iconCode": "0xe381"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>linked_camera</i>",
        "iconName": "linked_camera",
        "iconCode": "0xe382"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>liquor</i>",
        "iconName": "liquor",
        "iconCode": "0xe383"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>list</i>",
        "iconName": "list",
        "iconCode": "0xe384"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>list_alt</i>",
        "iconName": "list_alt",
        "iconCode": "0xe385"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>live_help</i>",
        "iconName": "live_help",
        "iconCode": "0xe386"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>live_tv</i>",
        "iconName": "live_tv",
        "iconCode": "0xe387"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>living</i>",
        "iconName": "living",
        "iconCode": "0xe388"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_activity</i>",
        "iconName": "local_activity",
        "iconCode": "0xe389"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_airport</i>",
        "iconName": "local_airport",
        "iconCode": "0xe38a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_atm</i>",
        "iconName": "local_atm",
        "iconCode": "0xe38b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_attraction</i>",
        "iconName": "local_attraction",
        "iconCode": "0xe389"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_bar</i>",
        "iconName": "local_bar",
        "iconCode": "0xe38c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_cafe</i>",
        "iconName": "local_cafe",
        "iconCode": "0xe38d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_car_wash</i>",
        "iconName": "local_car_wash",
        "iconCode": "0xe38e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_convenience_store</i>",
        "iconName": "local_convenience_store",
        "iconCode": "0xe38f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_dining</i>",
        "iconName": "local_dining",
        "iconCode": "0xe390"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_drink</i>",
        "iconName": "local_drink",
        "iconCode": "0xe391"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_fire_department</i>",
        "iconName": "local_fire_department",
        "iconCode": "0xe392"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_florist</i>",
        "iconName": "local_florist",
        "iconCode": "0xe393"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_gas_station</i>",
        "iconName": "local_gas_station",
        "iconCode": "0xe394"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_grocery_store</i>",
        "iconName": "local_grocery_store",
        "iconCode": "0xe395"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_hospital</i>",
        "iconName": "local_hospital",
        "iconCode": "0xe396"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_hotel</i>",
        "iconName": "local_hotel",
        "iconCode": "0xe397"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_laundry_service</i>",
        "iconName": "local_laundry_service",
        "iconCode": "0xe398"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_library</i>",
        "iconName": "local_library",
        "iconCode": "0xe399"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_mall</i>",
        "iconName": "local_mall",
        "iconCode": "0xe39a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_movies</i>",
        "iconName": "local_movies",
        "iconCode": "0xe39b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_offer</i>",
        "iconName": "local_offer",
        "iconCode": "0xe39c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_parking</i>",
        "iconName": "local_parking",
        "iconCode": "0xe39d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_pharmacy</i>",
        "iconName": "local_pharmacy",
        "iconCode": "0xe39e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_phone</i>",
        "iconName": "local_phone",
        "iconCode": "0xe39f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_pizza</i>",
        "iconName": "local_pizza",
        "iconCode": "0xe3a0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_play</i>",
        "iconName": "local_play",
        "iconCode": "0xe3a1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_police</i>",
        "iconName": "local_police",
        "iconCode": "0xe3a2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_post_office</i>",
        "iconName": "local_post_office",
        "iconCode": "0xe3a3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_print_shop</i>",
        "iconName": "local_print_shop",
        "iconCode": "0xe3a4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_printshop</i>",
        "iconName": "local_printshop",
        "iconCode": "0xe3a4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_restaurant</i>",
        "iconName": "local_restaurant",
        "iconCode": "0xe390"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_see</i>",
        "iconName": "local_see",
        "iconCode": "0xe3a5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_shipping</i>",
        "iconName": "local_shipping",
        "iconCode": "0xe3a6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>local_taxi</i>",
        "iconName": "local_taxi",
        "iconCode": "0xe3a7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>location_city</i>",
        "iconName": "location_city",
        "iconCode": "0xe3a8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>location_disabled</i>",
        "iconName": "location_disabled",
        "iconCode": "0xe3a9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>location_history</i>",
        "iconName": "location_history",
        "iconCode": "0xe498"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>location_off</i>",
        "iconName": "location_off",
        "iconCode": "0xe3aa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>location_on</i>",
        "iconName": "location_on",
        "iconCode": "0xe3ab"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>location_pin</i>",
        "iconName": "location_pin",
        "iconCode": "0xe3ac"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>location_searching</i>",
        "iconName": "location_searching",
        "iconCode": "0xe3ad"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>lock</i>",
        "iconName": "lock",
        "iconCode": "0xe3ae"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>lock_clock</i>",
        "iconName": "lock_clock",
        "iconCode": "0xe3af"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>lock_open</i>",
        "iconName": "lock_open",
        "iconCode": "0xe3b0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>lock_outline</i>",
        "iconName": "lock_outline",
        "iconCode": "0xe3b1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>lock_reset</i>",
        "iconName": "lock_reset",
        "iconCode": "0xf0536"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>login</i>",
        "iconName": "login",
        "iconCode": "0xe3b2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>logo_dev</i>",
        "iconName": "logo_dev",
        "iconCode": "0xf0537"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>logout</i>",
        "iconName": "logout",
        "iconCode": "0xe3b3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>looks</i>",
        "iconName": "looks",
        "iconCode": "0xe3b4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>looks_3</i>",
        "iconName": "looks_3",
        "iconCode": "0xe3b5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>looks_4</i>",
        "iconName": "looks_4",
        "iconCode": "0xe3b6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>looks_5</i>",
        "iconName": "looks_5",
        "iconCode": "0xe3b7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>looks_6</i>",
        "iconName": "looks_6",
        "iconCode": "0xe3b8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>looks_one</i>",
        "iconName": "looks_one",
        "iconCode": "0xe3b9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>looks_two</i>",
        "iconName": "looks_two",
        "iconCode": "0xe3ba"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>loop</i>",
        "iconName": "loop",
        "iconCode": "0xe3bb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>loupe</i>",
        "iconName": "loupe",
        "iconCode": "0xe3bc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>low_priority</i>",
        "iconName": "low_priority",
        "iconCode": "0xe3bd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>loyalty</i>",
        "iconName": "loyalty",
        "iconCode": "0xe3be"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>lte_mobiledata</i>",
        "iconName": "lte_mobiledata",
        "iconCode": "0xe3bf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>lte_plus_mobiledata</i>",
        "iconName": "lte_plus_mobiledata",
        "iconCode": "0xe3c0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>luggage</i>",
        "iconName": "luggage",
        "iconCode": "0xe3c1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>lunch_dining</i>",
        "iconName": "lunch_dining",
        "iconCode": "0xe3c2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>lyrics</i>",
        "iconName": "lyrics",
        "iconCode": "0xf07a9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mail</i>",
        "iconName": "mail",
        "iconCode": "0xe3c3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mail_lock</i>",
        "iconName": "mail_lock",
        "iconCode": "0xf07aa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mail_outline</i>",
        "iconName": "mail_outline",
        "iconCode": "0xe3c4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>male</i>",
        "iconName": "male",
        "iconCode": "0xe3c5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>man</i>",
        "iconName": "man",
        "iconCode": "0xf0538"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>manage_accounts</i>",
        "iconName": "manage_accounts",
        "iconCode": "0xe3c6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>manage_history</i>",
        "iconName": "manage_history",
        "iconCode": "0xf07ab"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>manage_search</i>",
        "iconName": "manage_search",
        "iconCode": "0xe3c7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>map</i>",
        "iconName": "map",
        "iconCode": "0xe3c8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>maps_home_work</i>",
        "iconName": "maps_home_work",
        "iconCode": "0xe3c9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>maps_ugc</i>",
        "iconName": "maps_ugc",
        "iconCode": "0xe3ca"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>margin</i>",
        "iconName": "margin",
        "iconCode": "0xe3cb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mark_as_unread</i>",
        "iconName": "mark_as_unread",
        "iconCode": "0xe3cc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mark_chat_read</i>",
        "iconName": "mark_chat_read",
        "iconCode": "0xe3cd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mark_chat_unread</i>",
        "iconName": "mark_chat_unread",
        "iconCode": "0xe3ce"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mark_email_read</i>",
        "iconName": "mark_email_read",
        "iconCode": "0xe3cf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mark_email_unread</i>",
        "iconName": "mark_email_unread",
        "iconCode": "0xe3d0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mark_unread_chat_alt</i>",
        "iconName": "mark_unread_chat_alt",
        "iconCode": "0xf0539"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>markunread</i>",
        "iconName": "markunread",
        "iconCode": "0xe3d1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>markunread_mailbox</i>",
        "iconName": "markunread_mailbox",
        "iconCode": "0xe3d2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>masks</i>",
        "iconName": "masks",
        "iconCode": "0xe3d3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>maximize</i>",
        "iconName": "maximize",
        "iconCode": "0xe3d4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>media_bluetooth_off</i>",
        "iconName": "media_bluetooth_off",
        "iconCode": "0xe3d5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>media_bluetooth_on</i>",
        "iconName": "media_bluetooth_on",
        "iconCode": "0xe3d6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mediation</i>",
        "iconName": "mediation",
        "iconCode": "0xe3d7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>medical_information</i>",
        "iconName": "medical_information",
        "iconCode": "0xf07ac"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>medical_services</i>",
        "iconName": "medical_services",
        "iconCode": "0xe3d8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>medication</i>",
        "iconName": "medication",
        "iconCode": "0xe3d9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>medication_liquid</i>",
        "iconName": "medication_liquid",
        "iconCode": "0xf053a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>meeting_room</i>",
        "iconName": "meeting_room",
        "iconCode": "0xe3da"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>memory</i>",
        "iconName": "memory",
        "iconCode": "0xe3db"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>menu</i>",
        "iconName": "menu",
        "iconCode": "0xe3dc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>menu_book</i>",
        "iconName": "menu_book",
        "iconCode": "0xe3dd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>menu_open</i>",
        "iconName": "menu_open",
        "iconCode": "0xe3de"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>merge</i>",
        "iconName": "merge",
        "iconCode": "0xf053b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>merge_type</i>",
        "iconName": "merge_type",
        "iconCode": "0xe3df"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>message</i>",
        "iconName": "message",
        "iconCode": "0xe3e0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>messenger</i>",
        "iconName": "messenger",
        "iconCode": "0xe154"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>messenger_outline</i>",
        "iconName": "messenger_outline",
        "iconCode": "0xe155"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mic</i>",
        "iconName": "mic",
        "iconCode": "0xe3e1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mic_external_off</i>",
        "iconName": "mic_external_off",
        "iconCode": "0xe3e2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mic_external_on</i>",
        "iconName": "mic_external_on",
        "iconCode": "0xe3e3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mic_none</i>",
        "iconName": "mic_none",
        "iconCode": "0xe3e4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mic_off</i>",
        "iconName": "mic_off",
        "iconCode": "0xe3e5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>microwave</i>",
        "iconName": "microwave",
        "iconCode": "0xe3e6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>military_tech</i>",
        "iconName": "military_tech",
        "iconCode": "0xe3e7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>minimize</i>",
        "iconName": "minimize",
        "iconCode": "0xe3e8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>minor_crash</i>",
        "iconName": "minor_crash",
        "iconCode": "0xf07ad"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>miscellaneous_services</i>",
        "iconName": "miscellaneous_services",
        "iconCode": "0xe3e9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>missed_video_call</i>",
        "iconName": "missed_video_call",
        "iconCode": "0xe3ea"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mms</i>",
        "iconName": "mms",
        "iconCode": "0xe3eb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mobile_friendly</i>",
        "iconName": "mobile_friendly",
        "iconCode": "0xe3ec"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mobile_off</i>",
        "iconName": "mobile_off",
        "iconCode": "0xe3ed"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mobile_screen_share</i>",
        "iconName": "mobile_screen_share",
        "iconCode": "0xe3ee"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mobiledata_off</i>",
        "iconName": "mobiledata_off",
        "iconCode": "0xe3ef"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mode</i>",
        "iconName": "mode",
        "iconCode": "0xe3f0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mode_comment</i>",
        "iconName": "mode_comment",
        "iconCode": "0xe3f1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mode_edit</i>",
        "iconName": "mode_edit",
        "iconCode": "0xe3f2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mode_edit_outline</i>",
        "iconName": "mode_edit_outline",
        "iconCode": "0xe3f3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mode_fan_off</i>",
        "iconName": "mode_fan_off",
        "iconCode": "0xf07ae"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mode_night</i>",
        "iconName": "mode_night",
        "iconCode": "0xe3f4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mode_of_travel</i>",
        "iconName": "mode_of_travel",
        "iconCode": "0xf053c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mode_standby</i>",
        "iconName": "mode_standby",
        "iconCode": "0xe3f5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>model_training</i>",
        "iconName": "model_training",
        "iconCode": "0xe3f6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>monetization_on</i>",
        "iconName": "monetization_on",
        "iconCode": "0xe3f7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>money</i>",
        "iconName": "money",
        "iconCode": "0xe3f8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>money_off</i>",
        "iconName": "money_off",
        "iconCode": "0xe3f9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>money_off_csred</i>",
        "iconName": "money_off_csred",
        "iconCode": "0xe3fa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>monitor</i>",
        "iconName": "monitor",
        "iconCode": "0xe3fb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>monitor_heart</i>",
        "iconName": "monitor_heart",
        "iconCode": "0xf053d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>monitor_weight</i>",
        "iconName": "monitor_weight",
        "iconCode": "0xe3fc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>monochrome_photos</i>",
        "iconName": "monochrome_photos",
        "iconCode": "0xe3fd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mood</i>",
        "iconName": "mood",
        "iconCode": "0xe3fe"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mood_bad</i>",
        "iconName": "mood_bad",
        "iconCode": "0xe3ff"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>moped</i>",
        "iconName": "moped",
        "iconCode": "0xe400"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>more</i>",
        "iconName": "more",
        "iconCode": "0xe401"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>more_horiz</i>",
        "iconName": "more_horiz",
        "iconCode": "0xe402"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>more_time</i>",
        "iconName": "more_time",
        "iconCode": "0xe403"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>more_vert</i>",
        "iconName": "more_vert",
        "iconCode": "0xe404"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mosque</i>",
        "iconName": "mosque",
        "iconCode": "0xf053e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>motion_photos_auto</i>",
        "iconName": "motion_photos_auto",
        "iconCode": "0xe405"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>motion_photos_off</i>",
        "iconName": "motion_photos_off",
        "iconCode": "0xe406"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>motion_photos_on</i>",
        "iconName": "motion_photos_on",
        "iconCode": "0xe407"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>motion_photos_pause</i>",
        "iconName": "motion_photos_pause",
        "iconCode": "0xe408"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>motion_photos_paused</i>",
        "iconName": "motion_photos_paused",
        "iconCode": "0xe409"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>motorcycle</i>",
        "iconName": "motorcycle",
        "iconCode": "0xe40a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mouse</i>",
        "iconName": "mouse",
        "iconCode": "0xe40b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>move_down</i>",
        "iconName": "move_down",
        "iconCode": "0xf053f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>move_to_inbox</i>",
        "iconName": "move_to_inbox",
        "iconCode": "0xe40c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>move_up</i>",
        "iconName": "move_up",
        "iconCode": "0xf0540"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>movie</i>",
        "iconName": "movie",
        "iconCode": "0xe40d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>movie_creation</i>",
        "iconName": "movie_creation",
        "iconCode": "0xe40e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>movie_filter</i>",
        "iconName": "movie_filter",
        "iconCode": "0xe40f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>moving</i>",
        "iconName": "moving",
        "iconCode": "0xe410"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>mp</i>",
        "iconName": "mp",
        "iconCode": "0xe411"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>multiline_chart</i>",
        "iconName": "multiline_chart",
        "iconCode": "0xe412"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>multiple_stop</i>",
        "iconName": "multiple_stop",
        "iconCode": "0xe413"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>multitrack_audio</i>",
        "iconName": "multitrack_audio",
        "iconCode": "0xe2e3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>museum</i>",
        "iconName": "museum",
        "iconCode": "0xe414"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>music_note</i>",
        "iconName": "music_note",
        "iconCode": "0xe415"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>music_off</i>",
        "iconName": "music_off",
        "iconCode": "0xe416"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>music_video</i>",
        "iconName": "music_video",
        "iconCode": "0xe417"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>my_library_add</i>",
        "iconName": "my_library_add",
        "iconCode": "0xe375"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>my_library_books</i>",
        "iconName": "my_library_books",
        "iconCode": "0xe377"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>my_library_music</i>",
        "iconName": "my_library_music",
        "iconCode": "0xe378"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>my_location</i>",
        "iconName": "my_location",
        "iconCode": "0xe418"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>nat</i>",
        "iconName": "nat",
        "iconCode": "0xe419"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>nature</i>",
        "iconName": "nature",
        "iconCode": "0xe41a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>nature_people</i>",
        "iconName": "nature_people",
        "iconCode": "0xe41b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>navigate_before</i>",
        "iconName": "navigate_before",
        "iconCode": "0xe41c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>navigate_next</i>",
        "iconName": "navigate_next",
        "iconCode": "0xe41d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>navigation</i>",
        "iconName": "navigation",
        "iconCode": "0xe41e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>near_me</i>",
        "iconName": "near_me",
        "iconCode": "0xe41f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>near_me_disabled</i>",
        "iconName": "near_me_disabled",
        "iconCode": "0xe420"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>nearby_error</i>",
        "iconName": "nearby_error",
        "iconCode": "0xe421"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>nearby_off</i>",
        "iconName": "nearby_off",
        "iconCode": "0xe422"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>nest_cam_wired_stand</i>",
        "iconName": "nest_cam_wired_stand",
        "iconCode": "0xf07af"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>network_cell</i>",
        "iconName": "network_cell",
        "iconCode": "0xe423"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>network_check</i>",
        "iconName": "network_check",
        "iconCode": "0xe424"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>network_locked</i>",
        "iconName": "network_locked",
        "iconCode": "0xe425"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>network_ping</i>",
        "iconName": "network_ping",
        "iconCode": "0xf06bf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>network_wifi</i>",
        "iconName": "network_wifi",
        "iconCode": "0xe426"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>network_wifi_1_bar</i>",
        "iconName": "network_wifi_1_bar",
        "iconCode": "0xf07b0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>network_wifi_2_bar</i>",
        "iconName": "network_wifi_2_bar",
        "iconCode": "0xf07b1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>network_wifi_3_bar</i>",
        "iconName": "network_wifi_3_bar",
        "iconCode": "0xf07b2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>new_label</i>",
        "iconName": "new_label",
        "iconCode": "0xe427"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>new_releases</i>",
        "iconName": "new_releases",
        "iconCode": "0xe428"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>newspaper</i>",
        "iconName": "newspaper",
        "iconCode": "0xf0541"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>next_plan</i>",
        "iconName": "next_plan",
        "iconCode": "0xe429"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>next_week</i>",
        "iconName": "next_week",
        "iconCode": "0xe42a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>nfc</i>",
        "iconName": "nfc",
        "iconCode": "0xe42b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>night_shelter</i>",
        "iconName": "night_shelter",
        "iconCode": "0xe42c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>nightlife</i>",
        "iconName": "nightlife",
        "iconCode": "0xe42d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>nightlight</i>",
        "iconName": "nightlight",
        "iconCode": "0xe42e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>nightlight_round</i>",
        "iconName": "nightlight_round",
        "iconCode": "0xe42f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>nights_stay</i>",
        "iconName": "nights_stay",
        "iconCode": "0xe430"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_accounts</i>",
        "iconName": "no_accounts",
        "iconCode": "0xe431"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_adult_content</i>",
        "iconName": "no_adult_content",
        "iconCode": "0xf07b3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_backpack</i>",
        "iconName": "no_backpack",
        "iconCode": "0xe432"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_cell</i>",
        "iconName": "no_cell",
        "iconCode": "0xe433"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_crash</i>",
        "iconName": "no_crash",
        "iconCode": "0xf07b4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_drinks</i>",
        "iconName": "no_drinks",
        "iconCode": "0xe434"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_encryption</i>",
        "iconName": "no_encryption",
        "iconCode": "0xe435"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_encryption_gmailerrorred</i>",
        "iconName": "no_encryption_gmailerrorred",
        "iconCode": "0xe436"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_flash</i>",
        "iconName": "no_flash",
        "iconCode": "0xe437"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_food</i>",
        "iconName": "no_food",
        "iconCode": "0xe438"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_luggage</i>",
        "iconName": "no_luggage",
        "iconCode": "0xe439"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_meals</i>",
        "iconName": "no_meals",
        "iconCode": "0xe43a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_meals_ouline</i>",
        "iconName": "no_meals_ouline",
        "iconCode": "0xe43b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_meeting_room</i>",
        "iconName": "no_meeting_room",
        "iconCode": "0xe43c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_photography</i>",
        "iconName": "no_photography",
        "iconCode": "0xe43d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_sim</i>",
        "iconName": "no_sim",
        "iconCode": "0xe43e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_stroller</i>",
        "iconName": "no_stroller",
        "iconCode": "0xe43f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>no_transfer</i>",
        "iconName": "no_transfer",
        "iconCode": "0xe440"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>noise_aware</i>",
        "iconName": "noise_aware",
        "iconCode": "0xf07b5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>noise_control_off</i>",
        "iconName": "noise_control_off",
        "iconCode": "0xf07b6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>nordic_walking</i>",
        "iconName": "nordic_walking",
        "iconCode": "0xe441"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>north</i>",
        "iconName": "north",
        "iconCode": "0xe442"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>north_east</i>",
        "iconName": "north_east",
        "iconCode": "0xe443"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>north_west</i>",
        "iconName": "north_west",
        "iconCode": "0xe444"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>not_accessible</i>",
        "iconName": "not_accessible",
        "iconCode": "0xe445"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>not_interested</i>",
        "iconName": "not_interested",
        "iconCode": "0xe446"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>not_listed_location</i>",
        "iconName": "not_listed_location",
        "iconCode": "0xe447"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>not_started</i>",
        "iconName": "not_started",
        "iconCode": "0xe448"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>note</i>",
        "iconName": "note",
        "iconCode": "0xe449"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>note_add</i>",
        "iconName": "note_add",
        "iconCode": "0xe44a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>note_alt</i>",
        "iconName": "note_alt",
        "iconCode": "0xe44b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>notes</i>",
        "iconName": "notes",
        "iconCode": "0xe44c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>notification_add</i>",
        "iconName": "notification_add",
        "iconCode": "0xe44d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>notification_important</i>",
        "iconName": "notification_important",
        "iconCode": "0xe44e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>notifications</i>",
        "iconName": "notifications",
        "iconCode": "0xe44f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>notifications_active</i>",
        "iconName": "notifications_active",
        "iconCode": "0xe450"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>notifications_none</i>",
        "iconName": "notifications_none",
        "iconCode": "0xe451"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>notifications_off</i>",
        "iconName": "notifications_off",
        "iconCode": "0xe452"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>notifications_on</i>",
        "iconName": "notifications_on",
        "iconCode": "0xe450"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>notifications_paused</i>",
        "iconName": "notifications_paused",
        "iconCode": "0xe453"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>now_wallpaper</i>",
        "iconName": "now_wallpaper",
        "iconCode": "0xe6ca"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>now_widgets</i>",
        "iconName": "now_widgets",
        "iconCode": "0xe6e6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>numbers</i>",
        "iconName": "numbers",
        "iconCode": "0xf0542"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>offline_bolt</i>",
        "iconName": "offline_bolt",
        "iconCode": "0xe454"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>offline_pin</i>",
        "iconName": "offline_pin",
        "iconCode": "0xe455"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>offline_share</i>",
        "iconName": "offline_share",
        "iconCode": "0xe456"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>oil_barrel</i>",
        "iconName": "oil_barrel",
        "iconCode": "0xf07b7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>on_device_training</i>",
        "iconName": "on_device_training",
        "iconCode": "0xf07b8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>ondemand_video</i>",
        "iconName": "ondemand_video",
        "iconCode": "0xe457"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>online_prediction</i>",
        "iconName": "online_prediction",
        "iconCode": "0xe458"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>opacity</i>",
        "iconName": "opacity",
        "iconCode": "0xe459"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>open_in_browser</i>",
        "iconName": "open_in_browser",
        "iconCode": "0xe45a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>open_in_full</i>",
        "iconName": "open_in_full",
        "iconCode": "0xe45b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>open_in_new</i>",
        "iconName": "open_in_new",
        "iconCode": "0xe45c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>open_in_new_off</i>",
        "iconName": "open_in_new_off",
        "iconCode": "0xe45d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>open_with</i>",
        "iconName": "open_with",
        "iconCode": "0xe45e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>other_houses</i>",
        "iconName": "other_houses",
        "iconCode": "0xe45f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>outbond</i>",
        "iconName": "outbond",
        "iconCode": "0xe460"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>outbound</i>",
        "iconName": "outbound",
        "iconCode": "0xe461"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>outbox</i>",
        "iconName": "outbox",
        "iconCode": "0xe462"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>outdoor_grill</i>",
        "iconName": "outdoor_grill",
        "iconCode": "0xe463"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>outgoing_mail</i>",
        "iconName": "outgoing_mail",
        "iconCode": "0xe464"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>outlet</i>",
        "iconName": "outlet",
        "iconCode": "0xe465"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>outlined_flag</i>",
        "iconName": "outlined_flag",
        "iconCode": "0xe466"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>output</i>",
        "iconName": "output",
        "iconCode": "0xf0543"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>padding</i>",
        "iconName": "padding",
        "iconCode": "0xe467"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pages</i>",
        "iconName": "pages",
        "iconCode": "0xe468"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pageview</i>",
        "iconName": "pageview",
        "iconCode": "0xe469"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>paid</i>",
        "iconName": "paid",
        "iconCode": "0xe46a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>palette</i>",
        "iconName": "palette",
        "iconCode": "0xe46b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pan_tool</i>",
        "iconName": "pan_tool",
        "iconCode": "0xe46c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pan_tool_alt</i>",
        "iconName": "pan_tool_alt",
        "iconCode": "0xf0544"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>panorama</i>",
        "iconName": "panorama",
        "iconCode": "0xe46d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>panorama_fish_eye</i>",
        "iconName": "panorama_fish_eye",
        "iconCode": "0xe46e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>panorama_fisheye</i>",
        "iconName": "panorama_fisheye",
        "iconCode": "0xe46e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>panorama_horizontal</i>",
        "iconName": "panorama_horizontal",
        "iconCode": "0xe46f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>panorama_horizontal_select</i>",
        "iconName": "panorama_horizontal_select",
        "iconCode": "0xe470"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>panorama_photosphere</i>",
        "iconName": "panorama_photosphere",
        "iconCode": "0xe471"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>panorama_photosphere_select</i>",
        "iconName": "panorama_photosphere_select",
        "iconCode": "0xe472"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>panorama_vertical</i>",
        "iconName": "panorama_vertical",
        "iconCode": "0xe473"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>panorama_vertical_select</i>",
        "iconName": "panorama_vertical_select",
        "iconCode": "0xe474"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>panorama_wide_angle</i>",
        "iconName": "panorama_wide_angle",
        "iconCode": "0xe475"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>panorama_wide_angle_select</i>",
        "iconName": "panorama_wide_angle_select",
        "iconCode": "0xe476"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>paragliding</i>",
        "iconName": "paragliding",
        "iconCode": "0xe477"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>park</i>",
        "iconName": "park",
        "iconCode": "0xe478"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>party_mode</i>",
        "iconName": "party_mode",
        "iconCode": "0xe479"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>password</i>",
        "iconName": "password",
        "iconCode": "0xe47a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>paste</i>",
        "iconName": "paste",
        "iconCode": "0xe192"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pattern</i>",
        "iconName": "pattern",
        "iconCode": "0xe47b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pause</i>",
        "iconName": "pause",
        "iconCode": "0xe47c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pause_circle</i>",
        "iconName": "pause_circle",
        "iconCode": "0xe47d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pause_circle_filled</i>",
        "iconName": "pause_circle_filled",
        "iconCode": "0xe47e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pause_circle_outline</i>",
        "iconName": "pause_circle_outline",
        "iconCode": "0xe47f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pause_presentation</i>",
        "iconName": "pause_presentation",
        "iconCode": "0xe480"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>payment</i>",
        "iconName": "payment",
        "iconCode": "0xe481"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>payments</i>",
        "iconName": "payments",
        "iconCode": "0xe482"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>paypal</i>",
        "iconName": "paypal",
        "iconCode": "0xf0545"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pedal_bike</i>",
        "iconName": "pedal_bike",
        "iconCode": "0xe483"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pending</i>",
        "iconName": "pending",
        "iconCode": "0xe484"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pending_actions</i>",
        "iconName": "pending_actions",
        "iconCode": "0xe485"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pentagon</i>",
        "iconName": "pentagon",
        "iconCode": "0xf0546"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>people</i>",
        "iconName": "people",
        "iconCode": "0xe486"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>people_alt</i>",
        "iconName": "people_alt",
        "iconCode": "0xe487"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>people_outline</i>",
        "iconName": "people_outline",
        "iconCode": "0xe488"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>percent</i>",
        "iconName": "percent",
        "iconCode": "0xf0547"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>perm_camera_mic</i>",
        "iconName": "perm_camera_mic",
        "iconCode": "0xe489"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>perm_contact_cal</i>",
        "iconName": "perm_contact_cal",
        "iconCode": "0xe48a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>perm_contact_calendar</i>",
        "iconName": "perm_contact_calendar",
        "iconCode": "0xe48a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>perm_data_setting</i>",
        "iconName": "perm_data_setting",
        "iconCode": "0xe48b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>perm_device_info</i>",
        "iconName": "perm_device_info",
        "iconCode": "0xe48c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>perm_device_information</i>",
        "iconName": "perm_device_information",
        "iconCode": "0xe48c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>perm_identity</i>",
        "iconName": "perm_identity",
        "iconCode": "0xe48d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>perm_media</i>",
        "iconName": "perm_media",
        "iconCode": "0xe48e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>perm_phone_msg</i>",
        "iconName": "perm_phone_msg",
        "iconCode": "0xe48f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>perm_scan_wifi</i>",
        "iconName": "perm_scan_wifi",
        "iconCode": "0xe490"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>person</i>",
        "iconName": "person",
        "iconCode": "0xe491"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>person_add</i>",
        "iconName": "person_add",
        "iconCode": "0xe492"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>person_add_alt</i>",
        "iconName": "person_add_alt",
        "iconCode": "0xe493"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>person_add_alt_1</i>",
        "iconName": "person_add_alt_1",
        "iconCode": "0xe494"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>person_add_disabled</i>",
        "iconName": "person_add_disabled",
        "iconCode": "0xe495"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>person_off</i>",
        "iconName": "person_off",
        "iconCode": "0xe496"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>person_outline</i>",
        "iconName": "person_outline",
        "iconCode": "0xe497"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>person_pin</i>",
        "iconName": "person_pin",
        "iconCode": "0xe498"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>person_pin_circle</i>",
        "iconName": "person_pin_circle",
        "iconCode": "0xe499"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>person_remove</i>",
        "iconName": "person_remove",
        "iconCode": "0xe49a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>person_remove_alt_1</i>",
        "iconName": "person_remove_alt_1",
        "iconCode": "0xe49b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>person_search</i>",
        "iconName": "person_search",
        "iconCode": "0xe49c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>personal_injury</i>",
        "iconName": "personal_injury",
        "iconCode": "0xe49d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>personal_video</i>",
        "iconName": "personal_video",
        "iconCode": "0xe49e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pest_control</i>",
        "iconName": "pest_control",
        "iconCode": "0xe49f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pest_control_rodent</i>",
        "iconName": "pest_control_rodent",
        "iconCode": "0xe4a0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pets</i>",
        "iconName": "pets",
        "iconCode": "0xe4a1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phishing</i>",
        "iconName": "phishing",
        "iconCode": "0xf0548"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phone</i>",
        "iconName": "phone",
        "iconCode": "0xe4a2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phone_android</i>",
        "iconName": "phone_android",
        "iconCode": "0xe4a3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phone_bluetooth_speaker</i>",
        "iconName": "phone_bluetooth_speaker",
        "iconCode": "0xe4a4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phone_callback</i>",
        "iconName": "phone_callback",
        "iconCode": "0xe4a5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phone_disabled</i>",
        "iconName": "phone_disabled",
        "iconCode": "0xe4a6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phone_enabled</i>",
        "iconName": "phone_enabled",
        "iconCode": "0xe4a7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phone_forwarded</i>",
        "iconName": "phone_forwarded",
        "iconCode": "0xe4a8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phone_in_talk</i>",
        "iconName": "phone_in_talk",
        "iconCode": "0xe4a9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phone_iphone</i>",
        "iconName": "phone_iphone",
        "iconCode": "0xe4aa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phone_locked</i>",
        "iconName": "phone_locked",
        "iconCode": "0xe4ab"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phone_missed</i>",
        "iconName": "phone_missed",
        "iconCode": "0xe4ac"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phone_paused</i>",
        "iconName": "phone_paused",
        "iconCode": "0xe4ad"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phonelink</i>",
        "iconName": "phonelink",
        "iconCode": "0xe4ae"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phonelink_erase</i>",
        "iconName": "phonelink_erase",
        "iconCode": "0xe4af"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phonelink_lock</i>",
        "iconName": "phonelink_lock",
        "iconCode": "0xe4b0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phonelink_off</i>",
        "iconName": "phonelink_off",
        "iconCode": "0xe4b1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phonelink_ring</i>",
        "iconName": "phonelink_ring",
        "iconCode": "0xe4b2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>phonelink_setup</i>",
        "iconName": "phonelink_setup",
        "iconCode": "0xe4b3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>photo</i>",
        "iconName": "photo",
        "iconCode": "0xe4b4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>photo_album</i>",
        "iconName": "photo_album",
        "iconCode": "0xe4b5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>photo_camera</i>",
        "iconName": "photo_camera",
        "iconCode": "0xe4b6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>photo_camera_back</i>",
        "iconName": "photo_camera_back",
        "iconCode": "0xe4b7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>photo_camera_front</i>",
        "iconName": "photo_camera_front",
        "iconCode": "0xe4b8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>photo_filter</i>",
        "iconName": "photo_filter",
        "iconCode": "0xe4b9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>photo_library</i>",
        "iconName": "photo_library",
        "iconCode": "0xe4ba"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>photo_size_select_actual</i>",
        "iconName": "photo_size_select_actual",
        "iconCode": "0xe4bb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>photo_size_select_large</i>",
        "iconName": "photo_size_select_large",
        "iconCode": "0xe4bc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>photo_size_select_small</i>",
        "iconName": "photo_size_select_small",
        "iconCode": "0xe4bd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>php</i>",
        "iconName": "php",
        "iconCode": "0xf0549"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>piano</i>",
        "iconName": "piano",
        "iconCode": "0xe4be"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>piano_off</i>",
        "iconName": "piano_off",
        "iconCode": "0xe4bf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>picture_as_pdf</i>",
        "iconName": "picture_as_pdf",
        "iconCode": "0xe4c0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>picture_in_picture</i>",
        "iconName": "picture_in_picture",
        "iconCode": "0xe4c1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>picture_in_picture_alt</i>",
        "iconName": "picture_in_picture_alt",
        "iconCode": "0xe4c2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pie_chart</i>",
        "iconName": "pie_chart",
        "iconCode": "0xe4c3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pin</i>",
        "iconName": "pin",
        "iconCode": "0xe4c6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pin_drop</i>",
        "iconName": "pin_drop",
        "iconCode": "0xe4c7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pin_end</i>",
        "iconName": "pin_end",
        "iconCode": "0xf054b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pin_invoke</i>",
        "iconName": "pin_invoke",
        "iconCode": "0xf054c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pinch</i>",
        "iconName": "pinch",
        "iconCode": "0xf054d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pivot_table_chart</i>",
        "iconName": "pivot_table_chart",
        "iconCode": "0xe4c8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pix</i>",
        "iconName": "pix",
        "iconCode": "0xf054e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>place</i>",
        "iconName": "place",
        "iconCode": "0xe4c9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>plagiarism</i>",
        "iconName": "plagiarism",
        "iconCode": "0xe4ca"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>play_arrow</i>",
        "iconName": "play_arrow",
        "iconCode": "0xe4cb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>play_circle</i>",
        "iconName": "play_circle",
        "iconCode": "0xe4cc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>play_circle_fill</i>",
        "iconName": "play_circle_fill",
        "iconCode": "0xe4cd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>play_circle_filled</i>",
        "iconName": "play_circle_filled",
        "iconCode": "0xe4cd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>play_circle_outline</i>",
        "iconName": "play_circle_outline",
        "iconCode": "0xe4ce"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>play_disabled</i>",
        "iconName": "play_disabled",
        "iconCode": "0xe4cf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>play_for_work</i>",
        "iconName": "play_for_work",
        "iconCode": "0xe4d0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>play_lesson</i>",
        "iconName": "play_lesson",
        "iconCode": "0xe4d1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>playlist_add</i>",
        "iconName": "playlist_add",
        "iconCode": "0xe4d2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>playlist_add_check</i>",
        "iconName": "playlist_add_check",
        "iconCode": "0xe4d3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>playlist_add_check_circle</i>",
        "iconName": "playlist_add_check_circle",
        "iconCode": "0xf054f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>playlist_add_circle</i>",
        "iconName": "playlist_add_circle",
        "iconCode": "0xf0550"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>playlist_play</i>",
        "iconName": "playlist_play",
        "iconCode": "0xe4d4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>playlist_remove</i>",
        "iconName": "playlist_remove",
        "iconCode": "0xf0551"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>plumbing</i>",
        "iconName": "plumbing",
        "iconCode": "0xe4d5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>plus_one</i>",
        "iconName": "plus_one",
        "iconCode": "0xe4d6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>podcasts</i>",
        "iconName": "podcasts",
        "iconCode": "0xe4d7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>point_of_sale</i>",
        "iconName": "point_of_sale",
        "iconCode": "0xe4d8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>policy</i>",
        "iconName": "policy",
        "iconCode": "0xe4d9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>poll</i>",
        "iconName": "poll",
        "iconCode": "0xe4da"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>polyline</i>",
        "iconName": "polyline",
        "iconCode": "0xf0552"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>polymer</i>",
        "iconName": "polymer",
        "iconCode": "0xe4db"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pool</i>",
        "iconName": "pool",
        "iconCode": "0xe4dc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>portable_wifi_off</i>",
        "iconName": "portable_wifi_off",
        "iconCode": "0xe4dd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>portrait</i>",
        "iconName": "portrait",
        "iconCode": "0xe4de"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>post_add</i>",
        "iconName": "post_add",
        "iconCode": "0xe4df"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>power</i>",
        "iconName": "power",
        "iconCode": "0xe4e0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>power_input</i>",
        "iconName": "power_input",
        "iconCode": "0xe4e1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>power_off</i>",
        "iconName": "power_off",
        "iconCode": "0xe4e2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>power_settings_new</i>",
        "iconName": "power_settings_new",
        "iconCode": "0xe4e3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>precision_manufacturing</i>",
        "iconName": "precision_manufacturing",
        "iconCode": "0xe4e4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>pregnant_woman</i>",
        "iconName": "pregnant_woman",
        "iconCode": "0xe4e5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>present_to_all</i>",
        "iconName": "present_to_all",
        "iconCode": "0xe4e6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>preview</i>",
        "iconName": "preview",
        "iconCode": "0xe4e7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>price_change</i>",
        "iconName": "price_change",
        "iconCode": "0xe4e8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>price_check</i>",
        "iconName": "price_check",
        "iconCode": "0xe4e9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>print</i>",
        "iconName": "print",
        "iconCode": "0xe4ea"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>print_disabled</i>",
        "iconName": "print_disabled",
        "iconCode": "0xe4eb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>priority_high</i>",
        "iconName": "priority_high",
        "iconCode": "0xe4ec"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>privacy_tip</i>",
        "iconName": "privacy_tip",
        "iconCode": "0xe4ed"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>private_connectivity</i>",
        "iconName": "private_connectivity",
        "iconCode": "0xf0553"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>production_quantity_limits</i>",
        "iconName": "production_quantity_limits",
        "iconCode": "0xe4ee"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>propane</i>",
        "iconName": "propane",
        "iconCode": "0xf07b9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>propane_tank</i>",
        "iconName": "propane_tank",
        "iconCode": "0xf07ba"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>psychology</i>",
        "iconName": "psychology",
        "iconCode": "0xe4ef"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>public</i>",
        "iconName": "public",
        "iconCode": "0xe4f0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>public_off</i>",
        "iconName": "public_off",
        "iconCode": "0xe4f1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>publish</i>",
        "iconName": "publish",
        "iconCode": "0xe4f2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>published_with_changes</i>",
        "iconName": "published_with_changes",
        "iconCode": "0xe4f3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>punch_clock</i>",
        "iconName": "punch_clock",
        "iconCode": "0xf0554"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>push_pin</i>",
        "iconName": "push_pin",
        "iconCode": "0xe4f4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>qr_code</i>",
        "iconName": "qr_code",
        "iconCode": "0xe4f5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>qr_code_2</i>",
        "iconName": "qr_code_2",
        "iconCode": "0xe4f6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>qr_code_scanner</i>",
        "iconName": "qr_code_scanner",
        "iconCode": "0xe4f7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>query_builder</i>",
        "iconName": "query_builder",
        "iconCode": "0xe4f8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>query_stats</i>",
        "iconName": "query_stats",
        "iconCode": "0xe4f9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>question_answer</i>",
        "iconName": "question_answer",
        "iconCode": "0xe4fa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>question_mark</i>",
        "iconName": "question_mark",
        "iconCode": "0xf0555"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>queue</i>",
        "iconName": "queue",
        "iconCode": "0xe4fb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>queue_music</i>",
        "iconName": "queue_music",
        "iconCode": "0xe4fc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>queue_play_next</i>",
        "iconName": "queue_play_next",
        "iconCode": "0xe4fd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>quick_contacts_dialer</i>",
        "iconName": "quick_contacts_dialer",
        "iconCode": "0xe18c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>quick_contacts_mail</i>",
        "iconName": "quick_contacts_mail",
        "iconCode": "0xe18a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>quickreply</i>",
        "iconName": "quickreply",
        "iconCode": "0xe4fe"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>quiz</i>",
        "iconName": "quiz",
        "iconCode": "0xe4ff"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>quora</i>",
        "iconName": "quora",
        "iconCode": "0xf0556"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>r_mobiledata</i>",
        "iconName": "r_mobiledata",
        "iconCode": "0xe500"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>radar</i>",
        "iconName": "radar",
        "iconCode": "0xe501"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>radio</i>",
        "iconName": "radio",
        "iconCode": "0xe502"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>radio_button_checked</i>",
        "iconName": "radio_button_checked",
        "iconCode": "0xe503"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>radio_button_off</i>",
        "iconName": "radio_button_off",
        "iconCode": "0xe504"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>radio_button_on</i>",
        "iconName": "radio_button_on",
        "iconCode": "0xe503"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>radio_button_unchecked</i>",
        "iconName": "radio_button_unchecked",
        "iconCode": "0xe504"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>railway_alert</i>",
        "iconName": "railway_alert",
        "iconCode": "0xe505"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>ramen_dining</i>",
        "iconName": "ramen_dining",
        "iconCode": "0xe506"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>ramp_left</i>",
        "iconName": "ramp_left",
        "iconCode": "0xf0557"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>ramp_right</i>",
        "iconName": "ramp_right",
        "iconCode": "0xf0558"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rate_review</i>",
        "iconName": "rate_review",
        "iconCode": "0xe507"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>raw_off</i>",
        "iconName": "raw_off",
        "iconCode": "0xe508"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>raw_on</i>",
        "iconName": "raw_on",
        "iconCode": "0xe509"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>read_more</i>",
        "iconName": "read_more",
        "iconCode": "0xe50a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>real_estate_agent</i>",
        "iconName": "real_estate_agent",
        "iconCode": "0xe50b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>receipt</i>",
        "iconName": "receipt",
        "iconCode": "0xe50c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>receipt_long</i>",
        "iconName": "receipt_long",
        "iconCode": "0xe50d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>recent_actors</i>",
        "iconName": "recent_actors",
        "iconCode": "0xe50e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>recommend</i>",
        "iconName": "recommend",
        "iconCode": "0xe50f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>record_voice_over</i>",
        "iconName": "record_voice_over",
        "iconCode": "0xe510"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rectangle</i>",
        "iconName": "rectangle",
        "iconCode": "0xf0559"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>recycling</i>",
        "iconName": "recycling",
        "iconCode": "0xf055a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>reddit</i>",
        "iconName": "reddit",
        "iconCode": "0xf055b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>redeem</i>",
        "iconName": "redeem",
        "iconCode": "0xe511"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>redo</i>",
        "iconName": "redo",
        "iconCode": "0xe512"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>reduce_capacity</i>",
        "iconName": "reduce_capacity",
        "iconCode": "0xe513"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>refresh</i>",
        "iconName": "refresh",
        "iconCode": "0xe514"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>remember_me</i>",
        "iconName": "remember_me",
        "iconCode": "0xe515"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>remove</i>",
        "iconName": "remove",
        "iconCode": "0xe516"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>remove_circle</i>",
        "iconName": "remove_circle",
        "iconCode": "0xe517"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>remove_circle_outline</i>",
        "iconName": "remove_circle_outline",
        "iconCode": "0xe518"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>remove_done</i>",
        "iconName": "remove_done",
        "iconCode": "0xe519"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>remove_from_queue</i>",
        "iconName": "remove_from_queue",
        "iconCode": "0xe51a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>remove_moderator</i>",
        "iconName": "remove_moderator",
        "iconCode": "0xe51b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>remove_red_eye</i>",
        "iconName": "remove_red_eye",
        "iconCode": "0xe51c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>remove_road</i>",
        "iconName": "remove_road",
        "iconCode": "0xf07bb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>remove_shopping_cart</i>",
        "iconName": "remove_shopping_cart",
        "iconCode": "0xe51d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>reorder</i>",
        "iconName": "reorder",
        "iconCode": "0xe51e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>repeat</i>",
        "iconName": "repeat",
        "iconCode": "0xe51f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>repeat_on</i>",
        "iconName": "repeat_on",
        "iconCode": "0xe520"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>repeat_one</i>",
        "iconName": "repeat_one",
        "iconCode": "0xe521"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>repeat_one_on</i>",
        "iconName": "repeat_one_on",
        "iconCode": "0xe522"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>replay</i>",
        "iconName": "replay",
        "iconCode": "0xe523"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>replay_10</i>",
        "iconName": "replay_10",
        "iconCode": "0xe524"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>replay_30</i>",
        "iconName": "replay_30",
        "iconCode": "0xe525"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>replay_5</i>",
        "iconName": "replay_5",
        "iconCode": "0xe526"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>replay_circle_filled</i>",
        "iconName": "replay_circle_filled",
        "iconCode": "0xe527"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>reply</i>",
        "iconName": "reply",
        "iconCode": "0xe528"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>reply_all</i>",
        "iconName": "reply_all",
        "iconCode": "0xe529"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>report</i>",
        "iconName": "report",
        "iconCode": "0xe52a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>report_gmailerrorred</i>",
        "iconName": "report_gmailerrorred",
        "iconCode": "0xe52b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>report_off</i>",
        "iconName": "report_off",
        "iconCode": "0xe52c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>report_problem</i>",
        "iconName": "report_problem",
        "iconCode": "0xe52d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>request_page</i>",
        "iconName": "request_page",
        "iconCode": "0xe52e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>request_quote</i>",
        "iconName": "request_quote",
        "iconCode": "0xe52f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>reset_tv</i>",
        "iconName": "reset_tv",
        "iconCode": "0xe530"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>restart_alt</i>",
        "iconName": "restart_alt",
        "iconCode": "0xe531"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>restaurant</i>",
        "iconName": "restaurant",
        "iconCode": "0xe532"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>restaurant_menu</i>",
        "iconName": "restaurant_menu",
        "iconCode": "0xe533"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>restore</i>",
        "iconName": "restore",
        "iconCode": "0xe534"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>restore_from_trash</i>",
        "iconName": "restore_from_trash",
        "iconCode": "0xe535"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>restore_page</i>",
        "iconName": "restore_page",
        "iconCode": "0xe536"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>reviews</i>",
        "iconName": "reviews",
        "iconCode": "0xe537"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rice_bowl</i>",
        "iconName": "rice_bowl",
        "iconCode": "0xe538"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>ring_volume</i>",
        "iconName": "ring_volume",
        "iconCode": "0xe539"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rocket</i>",
        "iconName": "rocket",
        "iconCode": "0xf055c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rocket_launch</i>",
        "iconName": "rocket_launch",
        "iconCode": "0xf055d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>roller_shades</i>",
        "iconName": "roller_shades",
        "iconCode": "0xf07bc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>roller_shades_closed</i>",
        "iconName": "roller_shades_closed",
        "iconCode": "0xf07bd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>roller_skating</i>",
        "iconName": "roller_skating",
        "iconCode": "0xf06c0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>roofing</i>",
        "iconName": "roofing",
        "iconCode": "0xe53a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>room</i>",
        "iconName": "room",
        "iconCode": "0xe53b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>room_preferences</i>",
        "iconName": "room_preferences",
        "iconCode": "0xe53c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>room_service</i>",
        "iconName": "room_service",
        "iconCode": "0xe53d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rotate_90_degrees_ccw</i>",
        "iconName": "rotate_90_degrees_ccw",
        "iconCode": "0xe53e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rotate_90_degrees_cw</i>",
        "iconName": "rotate_90_degrees_cw",
        "iconCode": "0xf055e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rotate_left</i>",
        "iconName": "rotate_left",
        "iconCode": "0xe53f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rotate_right</i>",
        "iconName": "rotate_right",
        "iconCode": "0xe540"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>roundabout_left</i>",
        "iconName": "roundabout_left",
        "iconCode": "0xf055f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>roundabout_right</i>",
        "iconName": "roundabout_right",
        "iconCode": "0xf0560"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rounded_corner</i>",
        "iconName": "rounded_corner",
        "iconCode": "0xe541"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>route</i>",
        "iconName": "route",
        "iconCode": "0xf0561"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>router</i>",
        "iconName": "router",
        "iconCode": "0xe542"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rowing</i>",
        "iconName": "rowing",
        "iconCode": "0xe543"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rss_feed</i>",
        "iconName": "rss_feed",
        "iconCode": "0xe544"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rsvp</i>",
        "iconName": "rsvp",
        "iconCode": "0xe545"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rtt</i>",
        "iconName": "rtt",
        "iconCode": "0xe546"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rule</i>",
        "iconName": "rule",
        "iconCode": "0xe547"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rule_folder</i>",
        "iconName": "rule_folder",
        "iconCode": "0xe548"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>run_circle</i>",
        "iconName": "run_circle",
        "iconCode": "0xe549"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>running_with_errors</i>",
        "iconName": "running_with_errors",
        "iconCode": "0xe54a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>rv_hookup</i>",
        "iconName": "rv_hookup",
        "iconCode": "0xe54b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>safety_check</i>",
        "iconName": "safety_check",
        "iconCode": "0xf07be"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>safety_divider</i>",
        "iconName": "safety_divider",
        "iconCode": "0xe54c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sailing</i>",
        "iconName": "sailing",
        "iconCode": "0xe54d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sanitizer</i>",
        "iconName": "sanitizer",
        "iconCode": "0xe54e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>satellite</i>",
        "iconName": "satellite",
        "iconCode": "0xe54f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>satellite_alt</i>",
        "iconName": "satellite_alt",
        "iconCode": "0xf0562"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>save</i>",
        "iconName": "save",
        "iconCode": "0xe550"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>save_alt</i>",
        "iconName": "save_alt",
        "iconCode": "0xe551"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>save_as</i>",
        "iconName": "save_as",
        "iconCode": "0xf0563"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>saved_search</i>",
        "iconName": "saved_search",
        "iconCode": "0xe552"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>savings</i>",
        "iconName": "savings",
        "iconCode": "0xe553"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>scale</i>",
        "iconName": "scale",
        "iconCode": "0xf0564"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>scanner</i>",
        "iconName": "scanner",
        "iconCode": "0xe554"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>scatter_plot</i>",
        "iconName": "scatter_plot",
        "iconCode": "0xe555"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>schedule</i>",
        "iconName": "schedule",
        "iconCode": "0xe556"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>schedule_send</i>",
        "iconName": "schedule_send",
        "iconCode": "0xe557"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>schema</i>",
        "iconName": "schema",
        "iconCode": "0xe558"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>school</i>",
        "iconName": "school",
        "iconCode": "0xe559"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>science</i>",
        "iconName": "science",
        "iconCode": "0xe55a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>score</i>",
        "iconName": "score",
        "iconCode": "0xe55b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>scoreboard</i>",
        "iconName": "scoreboard",
        "iconCode": "0xf06c1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>screen_lock_landscape</i>",
        "iconName": "screen_lock_landscape",
        "iconCode": "0xe55c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>screen_lock_portrait</i>",
        "iconName": "screen_lock_portrait",
        "iconCode": "0xe55d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>screen_lock_rotation</i>",
        "iconName": "screen_lock_rotation",
        "iconCode": "0xe55e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>screen_rotation</i>",
        "iconName": "screen_rotation",
        "iconCode": "0xe55f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>screen_rotation_alt</i>",
        "iconName": "screen_rotation_alt",
        "iconCode": "0xf07bf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>screen_search_desktop</i>",
        "iconName": "screen_search_desktop",
        "iconCode": "0xe560"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>screen_share</i>",
        "iconName": "screen_share",
        "iconCode": "0xe561"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>screenshot</i>",
        "iconName": "screenshot",
        "iconCode": "0xe562"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>screenshot_monitor</i>",
        "iconName": "screenshot_monitor",
        "iconCode": "0xf07c0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>scuba_diving</i>",
        "iconName": "scuba_diving",
        "iconCode": "0xf06c2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sd</i>",
        "iconName": "sd",
        "iconCode": "0xe563"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sd_card</i>",
        "iconName": "sd_card",
        "iconCode": "0xe564"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sd_card_alert</i>",
        "iconName": "sd_card_alert",
        "iconCode": "0xe565"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sd_storage</i>",
        "iconName": "sd_storage",
        "iconCode": "0xe566"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>search</i>",
        "iconName": "search",
        "iconCode": "0xe567"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>search_off</i>",
        "iconName": "search_off",
        "iconCode": "0xe568"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>security</i>",
        "iconName": "security",
        "iconCode": "0xe569"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>security_update</i>",
        "iconName": "security_update",
        "iconCode": "0xe56a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>security_update_good</i>",
        "iconName": "security_update_good",
        "iconCode": "0xe56b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>security_update_warning</i>",
        "iconName": "security_update_warning",
        "iconCode": "0xe56c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>segment</i>",
        "iconName": "segment",
        "iconCode": "0xe56d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>select_all</i>",
        "iconName": "select_all",
        "iconCode": "0xe56e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>self_improvement</i>",
        "iconName": "self_improvement",
        "iconCode": "0xe56f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sell</i>",
        "iconName": "sell",
        "iconCode": "0xe570"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>send</i>",
        "iconName": "send",
        "iconCode": "0xe571"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>send_and_archive</i>",
        "iconName": "send_and_archive",
        "iconCode": "0xe572"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>send_time_extension</i>",
        "iconName": "send_time_extension",
        "iconCode": "0xf0565"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>send_to_mobile</i>",
        "iconName": "send_to_mobile",
        "iconCode": "0xe573"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sensor_door</i>",
        "iconName": "sensor_door",
        "iconCode": "0xe574"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sensor_occupied</i>",
        "iconName": "sensor_occupied",
        "iconCode": "0xf07c1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sensor_window</i>",
        "iconName": "sensor_window",
        "iconCode": "0xe575"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sensors</i>",
        "iconName": "sensors",
        "iconCode": "0xe576"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sensors_off</i>",
        "iconName": "sensors_off",
        "iconCode": "0xe577"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sentiment_dissatisfied</i>",
        "iconName": "sentiment_dissatisfied",
        "iconCode": "0xe578"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sentiment_neutral</i>",
        "iconName": "sentiment_neutral",
        "iconCode": "0xe579"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sentiment_satisfied</i>",
        "iconName": "sentiment_satisfied",
        "iconCode": "0xe57a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sentiment_satisfied_alt</i>",
        "iconName": "sentiment_satisfied_alt",
        "iconCode": "0xe57b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sentiment_very_dissatisfied</i>",
        "iconName": "sentiment_very_dissatisfied",
        "iconCode": "0xe57c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sentiment_very_satisfied</i>",
        "iconName": "sentiment_very_satisfied",
        "iconCode": "0xe57d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>set_meal</i>",
        "iconName": "set_meal",
        "iconCode": "0xe57e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings</i>",
        "iconName": "settings",
        "iconCode": "0xe57f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_accessibility</i>",
        "iconName": "settings_accessibility",
        "iconCode": "0xe580"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_applications</i>",
        "iconName": "settings_applications",
        "iconCode": "0xe581"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_backup_restore</i>",
        "iconName": "settings_backup_restore",
        "iconCode": "0xe582"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_bluetooth</i>",
        "iconName": "settings_bluetooth",
        "iconCode": "0xe583"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_brightness</i>",
        "iconName": "settings_brightness",
        "iconCode": "0xe584"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_cell</i>",
        "iconName": "settings_cell",
        "iconCode": "0xe585"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_display</i>",
        "iconName": "settings_display",
        "iconCode": "0xe584"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_ethernet</i>",
        "iconName": "settings_ethernet",
        "iconCode": "0xe586"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_input_antenna</i>",
        "iconName": "settings_input_antenna",
        "iconCode": "0xe587"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_input_component</i>",
        "iconName": "settings_input_component",
        "iconCode": "0xe588"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_input_composite</i>",
        "iconName": "settings_input_composite",
        "iconCode": "0xe589"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_input_hdmi</i>",
        "iconName": "settings_input_hdmi",
        "iconCode": "0xe58a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_input_svideo</i>",
        "iconName": "settings_input_svideo",
        "iconCode": "0xe58b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_overscan</i>",
        "iconName": "settings_overscan",
        "iconCode": "0xe58c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_phone</i>",
        "iconName": "settings_phone",
        "iconCode": "0xe58d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_power</i>",
        "iconName": "settings_power",
        "iconCode": "0xe58e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_remote</i>",
        "iconName": "settings_remote",
        "iconCode": "0xe58f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_suggest</i>",
        "iconName": "settings_suggest",
        "iconCode": "0xe590"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_system_daydream</i>",
        "iconName": "settings_system_daydream",
        "iconCode": "0xe591"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>settings_voice</i>",
        "iconName": "settings_voice",
        "iconCode": "0xe592"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>severe_cold</i>",
        "iconName": "severe_cold",
        "iconCode": "0xf07c2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>share</i>",
        "iconName": "share",
        "iconCode": "0xe593"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>share_arrival_time</i>",
        "iconName": "share_arrival_time",
        "iconCode": "0xe594"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>share_location</i>",
        "iconName": "share_location",
        "iconCode": "0xe595"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shield</i>",
        "iconName": "shield",
        "iconCode": "0xe596"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shield_moon</i>",
        "iconName": "shield_moon",
        "iconCode": "0xf0566"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shop</i>",
        "iconName": "shop",
        "iconCode": "0xe597"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shop_2</i>",
        "iconName": "shop_2",
        "iconCode": "0xe598"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shop_two</i>",
        "iconName": "shop_two",
        "iconCode": "0xe599"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shopify</i>",
        "iconName": "shopify",
        "iconCode": "0xf0567"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shopping_bag</i>",
        "iconName": "shopping_bag",
        "iconCode": "0xe59a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shopping_basket</i>",
        "iconName": "shopping_basket",
        "iconCode": "0xe59b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shopping_cart</i>",
        "iconName": "shopping_cart",
        "iconCode": "0xe59c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shopping_cart_checkout</i>",
        "iconName": "shopping_cart_checkout",
        "iconCode": "0xf0568"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>short_text</i>",
        "iconName": "short_text",
        "iconCode": "0xe59d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shortcut</i>",
        "iconName": "shortcut",
        "iconCode": "0xe59e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>show_chart</i>",
        "iconName": "show_chart",
        "iconCode": "0xe59f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shower</i>",
        "iconName": "shower",
        "iconCode": "0xe5a0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shuffle</i>",
        "iconName": "shuffle",
        "iconCode": "0xe5a1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shuffle_on</i>",
        "iconName": "shuffle_on",
        "iconCode": "0xe5a2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>shutter_speed</i>",
        "iconName": "shutter_speed",
        "iconCode": "0xe5a3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sick</i>",
        "iconName": "sick",
        "iconCode": "0xe5a4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sign_language</i>",
        "iconName": "sign_language",
        "iconCode": "0xf07c3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_cellular_0_bar</i>",
        "iconName": "signal_cellular_0_bar",
        "iconCode": "0xe5a5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_cellular_4_bar</i>",
        "iconName": "signal_cellular_4_bar",
        "iconCode": "0xe5a6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_cellular_alt</i>",
        "iconName": "signal_cellular_alt",
        "iconCode": "0xe5a7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_cellular_alt_1_bar</i>",
        "iconName": "signal_cellular_alt_1_bar",
        "iconCode": "0xf07c4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_cellular_alt_2_bar</i>",
        "iconName": "signal_cellular_alt_2_bar",
        "iconCode": "0xf07c5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_cellular_connected_no_internet_0_bar</i>",
        "iconName": "signal_cellular_connected_no_internet_0_bar",
        "iconCode": "0xe5a8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_cellular_connected_no_internet_4_bar</i>",
        "iconName": "signal_cellular_connected_no_internet_4_bar",
        "iconCode": "0xe5a9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_cellular_no_sim</i>",
        "iconName": "signal_cellular_no_sim",
        "iconCode": "0xe5aa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_cellular_nodata</i>",
        "iconName": "signal_cellular_nodata",
        "iconCode": "0xe5ab"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_cellular_null</i>",
        "iconName": "signal_cellular_null",
        "iconCode": "0xe5ac"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_cellular_off</i>",
        "iconName": "signal_cellular_off",
        "iconCode": "0xe5ad"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_wifi_0_bar</i>",
        "iconName": "signal_wifi_0_bar",
        "iconCode": "0xe5ae"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_wifi_4_bar</i>",
        "iconName": "signal_wifi_4_bar",
        "iconCode": "0xe5af"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_wifi_4_bar_lock</i>",
        "iconName": "signal_wifi_4_bar_lock",
        "iconCode": "0xe5b0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_wifi_bad</i>",
        "iconName": "signal_wifi_bad",
        "iconCode": "0xe5b1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_wifi_connected_no_internet_4</i>",
        "iconName": "signal_wifi_connected_no_internet_4",
        "iconCode": "0xe5b2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_wifi_off</i>",
        "iconName": "signal_wifi_off",
        "iconCode": "0xe5b3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_wifi_statusbar_4_bar</i>",
        "iconName": "signal_wifi_statusbar_4_bar",
        "iconCode": "0xe5b4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_wifi_statusbar_connected_no_internet_4</i>",
        "iconName": "signal_wifi_statusbar_connected_no_internet_4",
        "iconCode": "0xe5b5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signal_wifi_statusbar_null</i>",
        "iconName": "signal_wifi_statusbar_null",
        "iconCode": "0xe5b6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>signpost</i>",
        "iconName": "signpost",
        "iconCode": "0xf0569"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sim_card</i>",
        "iconName": "sim_card",
        "iconCode": "0xe5b7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sim_card_alert</i>",
        "iconName": "sim_card_alert",
        "iconCode": "0xe5b8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sim_card_download</i>",
        "iconName": "sim_card_download",
        "iconCode": "0xe5b9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>single_bed</i>",
        "iconName": "single_bed",
        "iconCode": "0xe5ba"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sip</i>",
        "iconName": "sip",
        "iconCode": "0xe5bb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>skateboarding</i>",
        "iconName": "skateboarding",
        "iconCode": "0xe5bc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>skip_next</i>",
        "iconName": "skip_next",
        "iconCode": "0xe5bd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>skip_previous</i>",
        "iconName": "skip_previous",
        "iconCode": "0xe5be"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sledding</i>",
        "iconName": "sledding",
        "iconCode": "0xe5bf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>slideshow</i>",
        "iconName": "slideshow",
        "iconCode": "0xe5c0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>slow_motion_video</i>",
        "iconName": "slow_motion_video",
        "iconCode": "0xe5c1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>smart_button</i>",
        "iconName": "smart_button",
        "iconCode": "0xe5c2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>smart_display</i>",
        "iconName": "smart_display",
        "iconCode": "0xe5c3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>smart_screen</i>",
        "iconName": "smart_screen",
        "iconCode": "0xe5c4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>smart_toy</i>",
        "iconName": "smart_toy",
        "iconCode": "0xe5c5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>smartphone</i>",
        "iconName": "smartphone",
        "iconCode": "0xe5c6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>smoke_free</i>",
        "iconName": "smoke_free",
        "iconCode": "0xe5c7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>smoking_rooms</i>",
        "iconName": "smoking_rooms",
        "iconCode": "0xe5c8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sms</i>",
        "iconName": "sms",
        "iconCode": "0xe5c9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sms_failed</i>",
        "iconName": "sms_failed",
        "iconCode": "0xe5ca"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>snapchat</i>",
        "iconName": "snapchat",
        "iconCode": "0xf056a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>snippet_folder</i>",
        "iconName": "snippet_folder",
        "iconCode": "0xe5cb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>snooze</i>",
        "iconName": "snooze",
        "iconCode": "0xe5cc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>snowboarding</i>",
        "iconName": "snowboarding",
        "iconCode": "0xe5cd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>snowing</i>",
        "iconName": "snowing",
        "iconCode": "0xf056b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>snowmobile</i>",
        "iconName": "snowmobile",
        "iconCode": "0xe5ce"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>snowshoeing</i>",
        "iconName": "snowshoeing",
        "iconCode": "0xe5cf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>soap</i>",
        "iconName": "soap",
        "iconCode": "0xe5d0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>social_distance</i>",
        "iconName": "social_distance",
        "iconCode": "0xe5d1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>solar_power</i>",
        "iconName": "solar_power",
        "iconCode": "0xf07c6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sort</i>",
        "iconName": "sort",
        "iconCode": "0xe5d2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sort_by_alpha</i>",
        "iconName": "sort_by_alpha",
        "iconCode": "0xe5d3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sos</i>",
        "iconName": "sos",
        "iconCode": "0xf07c7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>soup_kitchen</i>",
        "iconName": "soup_kitchen",
        "iconCode": "0xf056c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>source</i>",
        "iconName": "source",
        "iconCode": "0xe5d4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>south</i>",
        "iconName": "south",
        "iconCode": "0xe5d5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>south_america</i>",
        "iconName": "south_america",
        "iconCode": "0xf056d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>south_east</i>",
        "iconName": "south_east",
        "iconCode": "0xe5d6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>south_west</i>",
        "iconName": "south_west",
        "iconCode": "0xe5d7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>spa</i>",
        "iconName": "spa",
        "iconCode": "0xe5d8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>space_bar</i>",
        "iconName": "space_bar",
        "iconCode": "0xe5d9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>space_dashboard</i>",
        "iconName": "space_dashboard",
        "iconCode": "0xe5da"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>spatial_audio</i>",
        "iconName": "spatial_audio",
        "iconCode": "0xf07c8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>spatial_audio_off</i>",
        "iconName": "spatial_audio_off",
        "iconCode": "0xf07c9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>spatial_tracking</i>",
        "iconName": "spatial_tracking",
        "iconCode": "0xf07ca"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>speaker</i>",
        "iconName": "speaker",
        "iconCode": "0xe5db"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>speaker_group</i>",
        "iconName": "speaker_group",
        "iconCode": "0xe5dc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>speaker_notes</i>",
        "iconName": "speaker_notes",
        "iconCode": "0xe5dd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>speaker_notes_off</i>",
        "iconName": "speaker_notes_off",
        "iconCode": "0xe5de"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>speaker_phone</i>",
        "iconName": "speaker_phone",
        "iconCode": "0xe5df"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>speed</i>",
        "iconName": "speed",
        "iconCode": "0xe5e0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>spellcheck</i>",
        "iconName": "spellcheck",
        "iconCode": "0xe5e1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>splitscreen</i>",
        "iconName": "splitscreen",
        "iconCode": "0xe5e2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>spoke</i>",
        "iconName": "spoke",
        "iconCode": "0xf056e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports</i>",
        "iconName": "sports",
        "iconCode": "0xe5e3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_bar</i>",
        "iconName": "sports_bar",
        "iconCode": "0xe5e4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_baseball</i>",
        "iconName": "sports_baseball",
        "iconCode": "0xe5e5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_basketball</i>",
        "iconName": "sports_basketball",
        "iconCode": "0xe5e6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_cricket</i>",
        "iconName": "sports_cricket",
        "iconCode": "0xe5e7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_esports</i>",
        "iconName": "sports_esports",
        "iconCode": "0xe5e8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_football</i>",
        "iconName": "sports_football",
        "iconCode": "0xe5e9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_golf</i>",
        "iconName": "sports_golf",
        "iconCode": "0xe5ea"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_gymnastics</i>",
        "iconName": "sports_gymnastics",
        "iconCode": "0xf06c3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_handball</i>",
        "iconName": "sports_handball",
        "iconCode": "0xe5eb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_hockey</i>",
        "iconName": "sports_hockey",
        "iconCode": "0xe5ec"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_kabaddi</i>",
        "iconName": "sports_kabaddi",
        "iconCode": "0xe5ed"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_martial_arts</i>",
        "iconName": "sports_martial_arts",
        "iconCode": "0xf056f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_mma</i>",
        "iconName": "sports_mma",
        "iconCode": "0xe5ee"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_motorsports</i>",
        "iconName": "sports_motorsports",
        "iconCode": "0xe5ef"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_rugby</i>",
        "iconName": "sports_rugby",
        "iconCode": "0xe5f0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_score</i>",
        "iconName": "sports_score",
        "iconCode": "0xe5f1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_soccer</i>",
        "iconName": "sports_soccer",
        "iconCode": "0xe5f2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_tennis</i>",
        "iconName": "sports_tennis",
        "iconCode": "0xe5f3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sports_volleyball</i>",
        "iconName": "sports_volleyball",
        "iconCode": "0xe5f4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>square</i>",
        "iconName": "square",
        "iconCode": "0xf0570"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>square_foot</i>",
        "iconName": "square_foot",
        "iconCode": "0xe5f5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>ssid_chart</i>",
        "iconName": "ssid_chart",
        "iconCode": "0xf0571"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>stacked_bar_chart</i>",
        "iconName": "stacked_bar_chart",
        "iconCode": "0xe5f6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>stacked_line_chart</i>",
        "iconName": "stacked_line_chart",
        "iconCode": "0xe5f7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>stadium</i>",
        "iconName": "stadium",
        "iconCode": "0xf0572"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>stairs</i>",
        "iconName": "stairs",
        "iconCode": "0xe5f8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>star</i>",
        "iconName": "star",
        "iconCode": "0xe5f9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>star_border</i>",
        "iconName": "star_border",
        "iconCode": "0xe5fa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>star_border_purple500</i>",
        "iconName": "star_border_purple500",
        "iconCode": "0xe5fb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>star_half</i>",
        "iconName": "star_half",
        "iconCode": "0xe5fc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>star_outline</i>",
        "iconName": "star_outline",
        "iconCode": "0xe5fd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>star_purple500</i>",
        "iconName": "star_purple500",
        "iconCode": "0xe5fe"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>star_rate</i>",
        "iconName": "star_rate",
        "iconCode": "0xe5ff"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>stars</i>",
        "iconName": "stars",
        "iconCode": "0xe600"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>start</i>",
        "iconName": "start",
        "iconCode": "0xf0573"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>stay_current_landscape</i>",
        "iconName": "stay_current_landscape",
        "iconCode": "0xe601"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>stay_current_portrait</i>",
        "iconName": "stay_current_portrait",
        "iconCode": "0xe602"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>stay_primary_landscape</i>",
        "iconName": "stay_primary_landscape",
        "iconCode": "0xe603"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>stay_primary_portrait</i>",
        "iconName": "stay_primary_portrait",
        "iconCode": "0xe604"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sticky_note_2</i>",
        "iconName": "sticky_note_2",
        "iconCode": "0xe605"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>stop</i>",
        "iconName": "stop",
        "iconCode": "0xe606"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>stop_circle</i>",
        "iconName": "stop_circle",
        "iconCode": "0xe607"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>stop_screen_share</i>",
        "iconName": "stop_screen_share",
        "iconCode": "0xe608"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>storage</i>",
        "iconName": "storage",
        "iconCode": "0xe609"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>store</i>",
        "iconName": "store",
        "iconCode": "0xe60a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>store_mall_directory</i>",
        "iconName": "store_mall_directory",
        "iconCode": "0xe60b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>storefront</i>",
        "iconName": "storefront",
        "iconCode": "0xe60c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>storm</i>",
        "iconName": "storm",
        "iconCode": "0xe60d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>straight</i>",
        "iconName": "straight",
        "iconCode": "0xf0574"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>straighten</i>",
        "iconName": "straighten",
        "iconCode": "0xe60e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>stream</i>",
        "iconName": "stream",
        "iconCode": "0xe60f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>streetview</i>",
        "iconName": "streetview",
        "iconCode": "0xe610"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>strikethrough_s</i>",
        "iconName": "strikethrough_s",
        "iconCode": "0xe611"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>stroller</i>",
        "iconName": "stroller",
        "iconCode": "0xe612"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>style</i>",
        "iconName": "style",
        "iconCode": "0xe613"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>subdirectory_arrow_left</i>",
        "iconName": "subdirectory_arrow_left",
        "iconCode": "0xe614"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>subdirectory_arrow_right</i>",
        "iconName": "subdirectory_arrow_right",
        "iconCode": "0xe615"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>subject</i>",
        "iconName": "subject",
        "iconCode": "0xe616"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>subscript</i>",
        "iconName": "subscript",
        "iconCode": "0xe617"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>subscriptions</i>",
        "iconName": "subscriptions",
        "iconCode": "0xe618"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>subtitles</i>",
        "iconName": "subtitles",
        "iconCode": "0xe619"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>subtitles_off</i>",
        "iconName": "subtitles_off",
        "iconCode": "0xe61a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>subway</i>",
        "iconName": "subway",
        "iconCode": "0xe61b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>summarize</i>",
        "iconName": "summarize",
        "iconCode": "0xe61c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sunny</i>",
        "iconName": "sunny",
        "iconCode": "0xf0575"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sunny_snowing</i>",
        "iconName": "sunny_snowing",
        "iconCode": "0xf0576"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>superscript</i>",
        "iconName": "superscript",
        "iconCode": "0xe61d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>supervised_user_circle</i>",
        "iconName": "supervised_user_circle",
        "iconCode": "0xe61e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>supervisor_account</i>",
        "iconName": "supervisor_account",
        "iconCode": "0xe61f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>support</i>",
        "iconName": "support",
        "iconCode": "0xe620"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>support_agent</i>",
        "iconName": "support_agent",
        "iconCode": "0xe621"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>surfing</i>",
        "iconName": "surfing",
        "iconCode": "0xe622"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>surround_sound</i>",
        "iconName": "surround_sound",
        "iconCode": "0xe623"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swap_calls</i>",
        "iconName": "swap_calls",
        "iconCode": "0xe624"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swap_horiz</i>",
        "iconName": "swap_horiz",
        "iconCode": "0xe625"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swap_horizontal_circle</i>",
        "iconName": "swap_horizontal_circle",
        "iconCode": "0xe626"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swap_vert</i>",
        "iconName": "swap_vert",
        "iconCode": "0xe627"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swap_vert_circle</i>",
        "iconName": "swap_vert_circle",
        "iconCode": "0xe628"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swap_vertical_circle</i>",
        "iconName": "swap_vertical_circle",
        "iconCode": "0xe628"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swipe</i>",
        "iconName": "swipe",
        "iconCode": "0xe629"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swipe_down</i>",
        "iconName": "swipe_down",
        "iconCode": "0xf0578"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swipe_down_alt</i>",
        "iconName": "swipe_down_alt",
        "iconCode": "0xf0577"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swipe_left</i>",
        "iconName": "swipe_left",
        "iconCode": "0xf057a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swipe_left_alt</i>",
        "iconName": "swipe_left_alt",
        "iconCode": "0xf0579"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swipe_right</i>",
        "iconName": "swipe_right",
        "iconCode": "0xf057c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swipe_right_alt</i>",
        "iconName": "swipe_right_alt",
        "iconCode": "0xf057b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swipe_up</i>",
        "iconName": "swipe_up",
        "iconCode": "0xf057e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swipe_up_alt</i>",
        "iconName": "swipe_up_alt",
        "iconCode": "0xf057d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>swipe_vertical</i>",
        "iconName": "swipe_vertical",
        "iconCode": "0xf057f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>switch_access_shortcut</i>",
        "iconName": "switch_access_shortcut",
        "iconCode": "0xf0581"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>switch_access_shortcut_add</i>",
        "iconName": "switch_access_shortcut_add",
        "iconCode": "0xf0580"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>switch_account</i>",
        "iconName": "switch_account",
        "iconCode": "0xe62a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>switch_camera</i>",
        "iconName": "switch_camera",
        "iconCode": "0xe62b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>switch_left</i>",
        "iconName": "switch_left",
        "iconCode": "0xe62c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>switch_right</i>",
        "iconName": "switch_right",
        "iconCode": "0xe62d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>switch_video</i>",
        "iconName": "switch_video",
        "iconCode": "0xe62e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>synagogue</i>",
        "iconName": "synagogue",
        "iconCode": "0xf0582"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sync</i>",
        "iconName": "sync",
        "iconCode": "0xe62f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sync_alt</i>",
        "iconName": "sync_alt",
        "iconCode": "0xe630"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sync_disabled</i>",
        "iconName": "sync_disabled",
        "iconCode": "0xe631"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sync_lock</i>",
        "iconName": "sync_lock",
        "iconCode": "0xf0583"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>sync_problem</i>",
        "iconName": "sync_problem",
        "iconCode": "0xe632"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>system_security_update</i>",
        "iconName": "system_security_update",
        "iconCode": "0xe633"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>system_security_update_good</i>",
        "iconName": "system_security_update_good",
        "iconCode": "0xe634"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>system_security_update_warning</i>",
        "iconName": "system_security_update_warning",
        "iconCode": "0xe635"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>system_update</i>",
        "iconName": "system_update",
        "iconCode": "0xe636"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>system_update_alt</i>",
        "iconName": "system_update_alt",
        "iconCode": "0xe637"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>system_update_tv</i>",
        "iconName": "system_update_tv",
        "iconCode": "0xe637"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tab</i>",
        "iconName": "tab",
        "iconCode": "0xe638"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tab_unselected</i>",
        "iconName": "tab_unselected",
        "iconCode": "0xe639"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>table_bar</i>",
        "iconName": "table_bar",
        "iconCode": "0xf0584"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>table_chart</i>",
        "iconName": "table_chart",
        "iconCode": "0xe63a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>table_restaurant</i>",
        "iconName": "table_restaurant",
        "iconCode": "0xf0585"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>table_rows</i>",
        "iconName": "table_rows",
        "iconCode": "0xe63b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>table_view</i>",
        "iconName": "table_view",
        "iconCode": "0xe63c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tablet</i>",
        "iconName": "tablet",
        "iconCode": "0xe63d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tablet_android</i>",
        "iconName": "tablet_android",
        "iconCode": "0xe63e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tablet_mac</i>",
        "iconName": "tablet_mac",
        "iconCode": "0xe63f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tag</i>",
        "iconName": "tag",
        "iconCode": "0xe640"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tag_faces</i>",
        "iconName": "tag_faces",
        "iconCode": "0xe641"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>takeout_dining</i>",
        "iconName": "takeout_dining",
        "iconCode": "0xe642"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tap_and_play</i>",
        "iconName": "tap_and_play",
        "iconCode": "0xe643"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tapas</i>",
        "iconName": "tapas",
        "iconCode": "0xe644"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>task</i>",
        "iconName": "task",
        "iconCode": "0xe645"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>task_alt</i>",
        "iconName": "task_alt",
        "iconCode": "0xe646"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>taxi_alert</i>",
        "iconName": "taxi_alert",
        "iconCode": "0xe647"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>telegram</i>",
        "iconName": "telegram",
        "iconCode": "0xf0586"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>temple_buddhist</i>",
        "iconName": "temple_buddhist",
        "iconCode": "0xf0587"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>temple_hindu</i>",
        "iconName": "temple_hindu",
        "iconCode": "0xf0588"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>terminal</i>",
        "iconName": "terminal",
        "iconCode": "0xf0589"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>terrain</i>",
        "iconName": "terrain",
        "iconCode": "0xe648"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>text_decrease</i>",
        "iconName": "text_decrease",
        "iconCode": "0xf058a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>text_fields</i>",
        "iconName": "text_fields",
        "iconCode": "0xe649"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>text_format</i>",
        "iconName": "text_format",
        "iconCode": "0xe64a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>text_increase</i>",
        "iconName": "text_increase",
        "iconCode": "0xf058b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>text_rotate_up</i>",
        "iconName": "text_rotate_up",
        "iconCode": "0xe64b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>text_rotate_vertical</i>",
        "iconName": "text_rotate_vertical",
        "iconCode": "0xe64c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>text_rotation_angledown</i>",
        "iconName": "text_rotation_angledown",
        "iconCode": "0xe64d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>text_rotation_angleup</i>",
        "iconName": "text_rotation_angleup",
        "iconCode": "0xe64e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>text_rotation_down</i>",
        "iconName": "text_rotation_down",
        "iconCode": "0xe64f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>text_rotation_none</i>",
        "iconName": "text_rotation_none",
        "iconCode": "0xe650"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>text_snippet</i>",
        "iconName": "text_snippet",
        "iconCode": "0xe651"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>textsms</i>",
        "iconName": "textsms",
        "iconCode": "0xe652"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>texture</i>",
        "iconName": "texture",
        "iconCode": "0xe653"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>theater_comedy</i>",
        "iconName": "theater_comedy",
        "iconCode": "0xe654"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>theaters</i>",
        "iconName": "theaters",
        "iconCode": "0xe655"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>thermostat</i>",
        "iconName": "thermostat",
        "iconCode": "0xe656"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>thermostat_auto</i>",
        "iconName": "thermostat_auto",
        "iconCode": "0xe657"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>thumb_down</i>",
        "iconName": "thumb_down",
        "iconCode": "0xe658"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>thumb_down_alt</i>",
        "iconName": "thumb_down_alt",
        "iconCode": "0xe659"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>thumb_down_off_alt</i>",
        "iconName": "thumb_down_off_alt",
        "iconCode": "0xe65a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>thumb_up</i>",
        "iconName": "thumb_up",
        "iconCode": "0xe65b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>thumb_up_alt</i>",
        "iconName": "thumb_up_alt",
        "iconCode": "0xe65c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>thumb_up_off_alt</i>",
        "iconName": "thumb_up_off_alt",
        "iconCode": "0xe65d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>thumbs_up_down</i>",
        "iconName": "thumbs_up_down",
        "iconCode": "0xe65e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>thunderstorm</i>",
        "iconName": "thunderstorm",
        "iconCode": "0xf07cb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tiktok</i>",
        "iconName": "tiktok",
        "iconCode": "0xf058c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>time_to_leave</i>",
        "iconName": "time_to_leave",
        "iconCode": "0xe65f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>timelapse</i>",
        "iconName": "timelapse",
        "iconCode": "0xe660"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>timeline</i>",
        "iconName": "timeline",
        "iconCode": "0xe661"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>timer</i>",
        "iconName": "timer",
        "iconCode": "0xe662"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>timer_10</i>",
        "iconName": "timer_10",
        "iconCode": "0xe663"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>timer_10_select</i>",
        "iconName": "timer_10_select",
        "iconCode": "0xe664"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>timer_3</i>",
        "iconName": "timer_3",
        "iconCode": "0xe665"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>timer_3_select</i>",
        "iconName": "timer_3_select",
        "iconCode": "0xe666"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>timer_off</i>",
        "iconName": "timer_off",
        "iconCode": "0xe667"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tips_and_updates</i>",
        "iconName": "tips_and_updates",
        "iconCode": "0xf058d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tire_repair</i>",
        "iconName": "tire_repair",
        "iconCode": "0xf06c4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>title</i>",
        "iconName": "title",
        "iconCode": "0xe668"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>toc</i>",
        "iconName": "toc",
        "iconCode": "0xe669"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>today</i>",
        "iconName": "today",
        "iconCode": "0xe66a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>toggle_off</i>",
        "iconName": "toggle_off",
        "iconCode": "0xe66b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>toggle_on</i>",
        "iconName": "toggle_on",
        "iconCode": "0xe66c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>token</i>",
        "iconName": "token",
        "iconCode": "0xf058e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>toll</i>",
        "iconName": "toll",
        "iconCode": "0xe66d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tonality</i>",
        "iconName": "tonality",
        "iconCode": "0xe66e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>topic</i>",
        "iconName": "topic",
        "iconCode": "0xe66f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tornado</i>",
        "iconName": "tornado",
        "iconCode": "0xf07cc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>touch_app</i>",
        "iconName": "touch_app",
        "iconCode": "0xe670"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tour</i>",
        "iconName": "tour",
        "iconCode": "0xe671"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>toys</i>",
        "iconName": "toys",
        "iconCode": "0xe672"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>track_changes</i>",
        "iconName": "track_changes",
        "iconCode": "0xe673"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>traffic</i>",
        "iconName": "traffic",
        "iconCode": "0xe674"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>train</i>",
        "iconName": "train",
        "iconCode": "0xe675"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tram</i>",
        "iconName": "tram",
        "iconCode": "0xe676"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>transcribe</i>",
        "iconName": "transcribe",
        "iconCode": "0xf07cd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>transfer_within_a_station</i>",
        "iconName": "transfer_within_a_station",
        "iconCode": "0xe677"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>transform</i>",
        "iconName": "transform",
        "iconCode": "0xe678"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>transgender</i>",
        "iconName": "transgender",
        "iconCode": "0xe679"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>transit_enterexit</i>",
        "iconName": "transit_enterexit",
        "iconCode": "0xe67a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>translate</i>",
        "iconName": "translate",
        "iconCode": "0xe67b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>travel_explore</i>",
        "iconName": "travel_explore",
        "iconCode": "0xe67c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>trending_down</i>",
        "iconName": "trending_down",
        "iconCode": "0xe67d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>trending_flat</i>",
        "iconName": "trending_flat",
        "iconCode": "0xe67e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>trending_neutral</i>",
        "iconName": "trending_neutral",
        "iconCode": "0xe67e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>trending_up</i>",
        "iconName": "trending_up",
        "iconCode": "0xe67f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>trip_origin</i>",
        "iconName": "trip_origin",
        "iconCode": "0xe680"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>troubleshoot</i>",
        "iconName": "troubleshoot",
        "iconCode": "0xf07ce"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>try</i>",
        "iconName": "try_sms_star",
        "iconCode": "0xe681"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tsunami</i>",
        "iconName": "tsunami",
        "iconCode": "0xf07cf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tty</i>",
        "iconName": "tty",
        "iconCode": "0xe682"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tune</i>",
        "iconName": "tune",
        "iconCode": "0xe683"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tungsten</i>",
        "iconName": "tungsten",
        "iconCode": "0xe684"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>turn_left</i>",
        "iconName": "turn_left",
        "iconCode": "0xf058f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>turn_right</i>",
        "iconName": "turn_right",
        "iconCode": "0xf0590"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>turn_sharp_left</i>",
        "iconName": "turn_sharp_left",
        "iconCode": "0xf0591"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>turn_sharp_right</i>",
        "iconName": "turn_sharp_right",
        "iconCode": "0xf0592"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>turn_slight_left</i>",
        "iconName": "turn_slight_left",
        "iconCode": "0xf0593"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>turn_slight_right</i>",
        "iconName": "turn_slight_right",
        "iconCode": "0xf0594"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>turned_in</i>",
        "iconName": "turned_in",
        "iconCode": "0xe685"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>turned_in_not</i>",
        "iconName": "turned_in_not",
        "iconCode": "0xe686"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tv</i>",
        "iconName": "tv",
        "iconCode": "0xe687"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>tv_off</i>",
        "iconName": "tv_off",
        "iconCode": "0xe688"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>two_wheeler</i>",
        "iconName": "two_wheeler",
        "iconCode": "0xe689"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>type_specimen</i>",
        "iconName": "type_specimen",
        "iconCode": "0xf07d0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>u_turn_left</i>",
        "iconName": "u_turn_left",
        "iconCode": "0xf0595"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>u_turn_right</i>",
        "iconName": "u_turn_right",
        "iconCode": "0xf0596"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>umbrella</i>",
        "iconName": "umbrella",
        "iconCode": "0xe68a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>unarchive</i>",
        "iconName": "unarchive",
        "iconCode": "0xe68b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>undo</i>",
        "iconName": "undo",
        "iconCode": "0xe68c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>unfold_less</i>",
        "iconName": "unfold_less",
        "iconCode": "0xe68d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>unfold_more</i>",
        "iconName": "unfold_more",
        "iconCode": "0xe68e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>unpublished</i>",
        "iconName": "unpublished",
        "iconCode": "0xe68f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>unsubscribe</i>",
        "iconName": "unsubscribe",
        "iconCode": "0xe690"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>upcoming</i>",
        "iconName": "upcoming",
        "iconCode": "0xe691"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>update</i>",
        "iconName": "update",
        "iconCode": "0xe692"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>update_disabled</i>",
        "iconName": "update_disabled",
        "iconCode": "0xe693"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>upgrade</i>",
        "iconName": "upgrade",
        "iconCode": "0xe694"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>upload</i>",
        "iconName": "upload",
        "iconCode": "0xe695"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>upload_file</i>",
        "iconName": "upload_file",
        "iconCode": "0xe696"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>usb</i>",
        "iconName": "usb",
        "iconCode": "0xe697"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>usb_off</i>",
        "iconName": "usb_off",
        "iconCode": "0xe698"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vaccines</i>",
        "iconName": "vaccines",
        "iconCode": "0xf0597"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vape_free</i>",
        "iconName": "vape_free",
        "iconCode": "0xf06c5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vaping_rooms</i>",
        "iconName": "vaping_rooms",
        "iconCode": "0xf06c6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>verified</i>",
        "iconName": "verified",
        "iconCode": "0xe699"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>verified_user</i>",
        "iconName": "verified_user",
        "iconCode": "0xe69a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vertical_align_bottom</i>",
        "iconName": "vertical_align_bottom",
        "iconCode": "0xe69b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vertical_align_center</i>",
        "iconName": "vertical_align_center",
        "iconCode": "0xe69c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vertical_align_top</i>",
        "iconName": "vertical_align_top",
        "iconCode": "0xe69d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vertical_distribute</i>",
        "iconName": "vertical_distribute",
        "iconCode": "0xe69e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vertical_shades</i>",
        "iconName": "vertical_shades",
        "iconCode": "0xf07d1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vertical_shades_closed</i>",
        "iconName": "vertical_shades_closed",
        "iconCode": "0xf07d2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vertical_split</i>",
        "iconName": "vertical_split",
        "iconCode": "0xe69f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vibration</i>",
        "iconName": "vibration",
        "iconCode": "0xe6a0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>video_call</i>",
        "iconName": "video_call",
        "iconCode": "0xe6a1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>video_camera_back</i>",
        "iconName": "video_camera_back",
        "iconCode": "0xe6a2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>video_camera_front</i>",
        "iconName": "video_camera_front",
        "iconCode": "0xe6a3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>video_collection</i>",
        "iconName": "video_collection",
        "iconCode": "0xe6a5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>video_file</i>",
        "iconName": "video_file",
        "iconCode": "0xf0598"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>video_label</i>",
        "iconName": "video_label",
        "iconCode": "0xe6a4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>video_library</i>",
        "iconName": "video_library",
        "iconCode": "0xe6a5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>video_settings</i>",
        "iconName": "video_settings",
        "iconCode": "0xe6a6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>video_stable</i>",
        "iconName": "video_stable",
        "iconCode": "0xe6a7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>videocam</i>",
        "iconName": "videocam",
        "iconCode": "0xe6a8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>videocam_off</i>",
        "iconName": "videocam_off",
        "iconCode": "0xe6a9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>videogame_asset</i>",
        "iconName": "videogame_asset",
        "iconCode": "0xe6aa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>videogame_asset_off</i>",
        "iconName": "videogame_asset_off",
        "iconCode": "0xe6ab"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_agenda</i>",
        "iconName": "view_agenda",
        "iconCode": "0xe6ac"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_array</i>",
        "iconName": "view_array",
        "iconCode": "0xe6ad"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_carousel</i>",
        "iconName": "view_carousel",
        "iconCode": "0xe6ae"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_column</i>",
        "iconName": "view_column",
        "iconCode": "0xe6af"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_comfortable</i>",
        "iconName": "view_comfortable",
        "iconCode": "0xe6b0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_comfy</i>",
        "iconName": "view_comfy",
        "iconCode": "0xe6b0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_comfy_alt</i>",
        "iconName": "view_comfy_alt",
        "iconCode": "0xf0599"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_compact</i>",
        "iconName": "view_compact",
        "iconCode": "0xe6b1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_compact_alt</i>",
        "iconName": "view_compact_alt",
        "iconCode": "0xf059a"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_cozy</i>",
        "iconName": "view_cozy",
        "iconCode": "0xf059b"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_day</i>",
        "iconName": "view_day",
        "iconCode": "0xe6b2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_headline</i>",
        "iconName": "view_headline",
        "iconCode": "0xe6b3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_in_ar</i>",
        "iconName": "view_in_ar",
        "iconCode": "0xe6b4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_kanban</i>",
        "iconName": "view_kanban",
        "iconCode": "0xf059c"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_list</i>",
        "iconName": "view_list",
        "iconCode": "0xe6b5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_module</i>",
        "iconName": "view_module",
        "iconCode": "0xe6b6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_quilt</i>",
        "iconName": "view_quilt",
        "iconCode": "0xe6b7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_sidebar</i>",
        "iconName": "view_sidebar",
        "iconCode": "0xe6b8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_stream</i>",
        "iconName": "view_stream",
        "iconCode": "0xe6b9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_timeline</i>",
        "iconName": "view_timeline",
        "iconCode": "0xf059d"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>view_week</i>",
        "iconName": "view_week",
        "iconCode": "0xe6ba"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vignette</i>",
        "iconName": "vignette",
        "iconCode": "0xe6bb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>villa</i>",
        "iconName": "villa",
        "iconCode": "0xe6bc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>visibility</i>",
        "iconName": "visibility",
        "iconCode": "0xe6bd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>visibility_off</i>",
        "iconName": "visibility_off",
        "iconCode": "0xe6be"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>voice_chat</i>",
        "iconName": "voice_chat",
        "iconCode": "0xe6bf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>voice_over_off</i>",
        "iconName": "voice_over_off",
        "iconCode": "0xe6c0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>voicemail</i>",
        "iconName": "voicemail",
        "iconCode": "0xe6c1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>volcano</i>",
        "iconName": "volcano",
        "iconCode": "0xf07d3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>volume_down</i>",
        "iconName": "volume_down",
        "iconCode": "0xe6c2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>volume_down_alt</i>",
        "iconName": "volume_down_alt",
        "iconCode": "0xf059e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>volume_mute</i>",
        "iconName": "volume_mute",
        "iconCode": "0xe6c3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>volume_off</i>",
        "iconName": "volume_off",
        "iconCode": "0xe6c4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>volume_up</i>",
        "iconName": "volume_up",
        "iconCode": "0xe6c5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>volunteer_activism</i>",
        "iconName": "volunteer_activism",
        "iconCode": "0xe6c6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vpn_key</i>",
        "iconName": "vpn_key",
        "iconCode": "0xe6c7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vpn_key_off</i>",
        "iconName": "vpn_key_off",
        "iconCode": "0xf059f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vpn_lock</i>",
        "iconName": "vpn_lock",
        "iconCode": "0xe6c8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>vrpano</i>",
        "iconName": "vrpano",
        "iconCode": "0xe6c9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wallet</i>",
        "iconName": "wallet",
        "iconCode": "0xf07d4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wallet_giftcard</i>",
        "iconName": "wallet_giftcard",
        "iconCode": "0xe13e"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wallet_membership</i>",
        "iconName": "wallet_membership",
        "iconCode": "0xe13f"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wallet_travel</i>",
        "iconName": "wallet_travel",
        "iconCode": "0xe140"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wallpaper</i>",
        "iconName": "wallpaper",
        "iconCode": "0xe6ca"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>warehouse</i>",
        "iconName": "warehouse",
        "iconCode": "0xf05a0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>warning</i>",
        "iconName": "warning",
        "iconCode": "0xe6cb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>warning_amber</i>",
        "iconName": "warning_amber",
        "iconCode": "0xe6cc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wash</i>",
        "iconName": "wash",
        "iconCode": "0xe6cd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>watch</i>",
        "iconName": "watch",
        "iconCode": "0xe6ce"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>watch_later</i>",
        "iconName": "watch_later",
        "iconCode": "0xe6cf"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>watch_off</i>",
        "iconName": "watch_off",
        "iconCode": "0xf05a1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>water</i>",
        "iconName": "water",
        "iconCode": "0xe6d0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>water_damage</i>",
        "iconName": "water_damage",
        "iconCode": "0xe6d1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>water_drop</i>",
        "iconName": "water_drop",
        "iconCode": "0xf05a2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>waterfall_chart</i>",
        "iconName": "waterfall_chart",
        "iconCode": "0xe6d2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>waves</i>",
        "iconName": "waves",
        "iconCode": "0xe6d3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>waving_hand</i>",
        "iconName": "waving_hand",
        "iconCode": "0xf05a3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wb_auto</i>",
        "iconName": "wb_auto",
        "iconCode": "0xe6d4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wb_cloudy</i>",
        "iconName": "wb_cloudy",
        "iconCode": "0xe6d5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wb_incandescent</i>",
        "iconName": "wb_incandescent",
        "iconCode": "0xe6d6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wb_iridescent</i>",
        "iconName": "wb_iridescent",
        "iconCode": "0xe6d7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wb_shade</i>",
        "iconName": "wb_shade",
        "iconCode": "0xe6d8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wb_sunny</i>",
        "iconName": "wb_sunny",
        "iconCode": "0xe6d9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wb_twighlight</i>",
        "iconName": "wb_twighlight",
        "iconCode": "0xe6da"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wb_twilight</i>",
        "iconName": "wb_twilight",
        "iconCode": "0xe6db"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wc</i>",
        "iconName": "wc",
        "iconCode": "0xe6dc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>web</i>",
        "iconName": "web",
        "iconCode": "0xe6dd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>web_asset</i>",
        "iconName": "web_asset",
        "iconCode": "0xe6de"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>web_asset_off</i>",
        "iconName": "web_asset_off",
        "iconCode": "0xe6df"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>web_stories</i>",
        "iconName": "web_stories",
        "iconCode": "0xe6e0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>webhook</i>",
        "iconName": "webhook",
        "iconCode": "0xf05a4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wechat</i>",
        "iconName": "wechat",
        "iconCode": "0xf05a5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>weekend</i>",
        "iconName": "weekend",
        "iconCode": "0xe6e1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>west</i>",
        "iconName": "west",
        "iconCode": "0xe6e2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>whatsapp</i>",
        "iconName": "whatsapp",
        "iconCode": "0xf05a6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>whatshot</i>",
        "iconName": "whatshot",
        "iconCode": "0xe6e3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wheelchair_pickup</i>",
        "iconName": "wheelchair_pickup",
        "iconCode": "0xe6e4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>where_to_vote</i>",
        "iconName": "where_to_vote",
        "iconCode": "0xe6e5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>widgets</i>",
        "iconName": "widgets",
        "iconCode": "0xe6e6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>width_full</i>",
        "iconName": "width_full",
        "iconCode": "0xf07d5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>width_normal</i>",
        "iconName": "width_normal",
        "iconCode": "0xf07d6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>width_wide</i>",
        "iconName": "width_wide",
        "iconCode": "0xf07d7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wifi</i>",
        "iconName": "wifi",
        "iconCode": "0xe6e7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wifi_1_bar</i>",
        "iconName": "wifi_1_bar",
        "iconCode": "0xf07d8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wifi_2_bar</i>",
        "iconName": "wifi_2_bar",
        "iconCode": "0xf07d9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wifi_calling</i>",
        "iconName": "wifi_calling",
        "iconCode": "0xe6e8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wifi_calling_3</i>",
        "iconName": "wifi_calling_3",
        "iconCode": "0xe6e9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wifi_channel</i>",
        "iconName": "wifi_channel",
        "iconCode": "0xf05a7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wifi_find</i>",
        "iconName": "wifi_find",
        "iconCode": "0xf05a8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wifi_lock</i>",
        "iconName": "wifi_lock",
        "iconCode": "0xe6ea"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wifi_off</i>",
        "iconName": "wifi_off",
        "iconCode": "0xe6eb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wifi_password</i>",
        "iconName": "wifi_password",
        "iconCode": "0xf05a9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wifi_protected_setup</i>",
        "iconName": "wifi_protected_setup",
        "iconCode": "0xe6ec"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wifi_tethering</i>",
        "iconName": "wifi_tethering",
        "iconCode": "0xe6ed"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wifi_tethering_error</i>",
        "iconName": "wifi_tethering_error",
        "iconCode": "0xf05aa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wifi_tethering_off</i>",
        "iconName": "wifi_tethering_off",
        "iconCode": "0xe6ef"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wind_power</i>",
        "iconName": "wind_power",
        "iconCode": "0xf07da"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>window</i>",
        "iconName": "window",
        "iconCode": "0xe6f0"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wine_bar</i>",
        "iconName": "wine_bar",
        "iconCode": "0xe6f1"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>woman</i>",
        "iconName": "woman",
        "iconCode": "0xf05ab"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>woo_commerce</i>",
        "iconName": "woo_commerce",
        "iconCode": "0xf05ac"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wordpress</i>",
        "iconName": "wordpress",
        "iconCode": "0xf05ad"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>work</i>",
        "iconName": "work",
        "iconCode": "0xe6f2"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>work_history</i>",
        "iconName": "work_history",
        "iconCode": "0xf07db"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>work_off</i>",
        "iconName": "work_off",
        "iconCode": "0xe6f3"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>work_outline</i>",
        "iconName": "work_outline",
        "iconCode": "0xe6f4"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>workspace_premium</i>",
        "iconName": "workspace_premium",
        "iconCode": "0xf05ae"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>workspaces</i>",
        "iconName": "workspaces",
        "iconCode": "0xe6f5"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>workspaces_filled</i>",
        "iconName": "workspaces_filled",
        "iconCode": "0xe6f6"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>workspaces_outline</i>",
        "iconName": "workspaces_outline",
        "iconCode": "0xe6f7"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wrap_text</i>",
        "iconName": "wrap_text",
        "iconCode": "0xe6f8"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wrong_location</i>",
        "iconName": "wrong_location",
        "iconCode": "0xe6f9"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>wysiwyg</i>",
        "iconName": "wysiwyg",
        "iconCode": "0xe6fa"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>yard</i>",
        "iconName": "yard",
        "iconCode": "0xe6fb"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>youtube_searched_for</i>",
        "iconName": "youtube_searched_for",
        "iconCode": "0xe6fc"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>zoom_in</i>",
        "iconName": "zoom_in",
        "iconCode": "0xe6fd"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>zoom_in_map</i>",
        "iconName": "zoom_in_map",
        "iconCode": "0xf05af"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>zoom_out</i>",
        "iconName": "zoom_out",
        "iconCode": "0xe6fe"
    },
    {
        "iconHtml": "<i class='material-icons md-36'>zoom_out_map</i>",
        "iconName": "zoom_out_map",
        "iconCode": "0xe6ff"
    }
]
''';

class FlutterIconParseModel {
  String? iconHtml;
  String? iconName;
  String? iconCode;

  FlutterIconParseModel({this.iconHtml, this.iconName, this.iconCode});

  FlutterIconParseModel.fromJson(Map<String, dynamic> json)
      : iconHtml = json['iconHtml'],
        iconName = json['iconName'],
        iconCode = json['iconCode'];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    (iconHtml != null) ? data['iconHtml'] = iconHtml : null;
    (iconName != null) ? data['iconName'] = iconName : null;
    (iconCode != null) ? data['iconCode'] = iconCode : null;
    return data;
  }
}

mixin GetFlutterIcon {
  final List<FlutterIconParseModel> flutterIconList =
      List<FlutterIconParseModel>.from((jsonDecode(googleJsonRaw) as List).map((e) => FlutterIconParseModel.fromJson(e)));
  //random icon
  IconData get randomIconData =>
      IconData(int.parse(flutterIconList[Random().nextInt(flutterIconList.length)].iconCode!), fontFamily: 'MaterialIcons');
}
