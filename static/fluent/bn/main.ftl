## The following terms must be treated as brand, and kept in English.
##
## They cannot be:
## - Transliterated.
## - Translated.
##
## Declension should be avoided where possible.
##
## Reference: https://mozilla-l10n.github.io/styleguides/mozilla_general/index.html#brands-copyright-and-trademark

-webthings-gateway-brand = WebThings গেটওয়ে
# Main Title
webthings-gateway = { -webthings-gateway-brand }
# Wordmark
wordmark =
    .alt = { -webthings-gateway-brand }

## Menu Items

things-menu-item = জিনিসসমূহ
rules-menu-item = নিয়মাবলী
logs-menu-item = লগ
floorplan-menu-item = ফ্লোরপ্ল্যান
settings-menu-item = সেটিং
log-out-button = লগ আউট

## Things

thing-details =
    .aria-label = বৈশিষ্ট্য দেখুন
add-things =
    .aria-label = নতুন জিনিস যুক্ত করুন

## Floorplan

upload-floorplan = ফ্লোরপ্ল্যান আপলোড করুন…
upload-floorplan-hint = (.svg প্রস্তাবিত করা হয়েছে)

## Top-Level Settings

settings-domain = ডোমেইন
settings-network = নেটওয়ার্ক
settings-users = ব্যবহারকারীগণ
settings-add-ons = অ্যাড-অন
settings-adapters = অ্যাডাপ্টার
settings-localization = স্থানীয়করণ
settings-updates = আপডেট
settings-authorizations = অনুমোদন
settings-experiments = এক্সপেরিমেন্ট
settings-developer = ডেভেলপার

## Domain Settings

domain-settings-local-label = লোকাল অ্যাক্সেস
domain-settings-local-update = হোস্টের নাম আপডেট করুন
domain-settings-remote-access = দূর থেকে ব্যবহার
domain-settings-local-name =
    .placeholder = গেটওয়ে

## Network Settings

network-settings-unsupported = এই প্ল্যাটফর্মের জন্য নেটওয়ার্ক সেটিংস কর্মক্ষম নয়।
network-settings-ethernet-image =
    .alt = ইথারনেট
network-settings-ethernet = ইথারনেট
network-settings-wifi-image =
    .alt = ওয়াই-ফাই
network-settings-wifi = ওয়াই-ফাই
network-settings-home-network-image =
    .alt = হোম নেটওয়ার্ক
network-settings-internet-image =
    .alt = ইন্টারনেট
network-settings-configure = কনফিগার করুন
network-settings-internet-wan = ইন্টারনেট (WAN)
network-settings-wan-mode = মোড
network-settings-home-network-lan = হোম নেটওয়ার্ক (LAN)
network-settings-wifi-wlan = ওয়াই-ফাই (WLAN)
network-settings-ip-address = আইপি ঠিকানা
network-settings-dhcp = স্বয়ংক্রিয় (DHCP)
network-settings-static = ম্যানুয়াল (স্ট্যাটিক আইপি)
network-settings-pppoe = ব্রিজ (PPPoE)
network-settings-static-ip-address = স্ট্যাটিক আইপি ঠিকানা
network-settings-network-mask = নেটওয়ার্ক মাস্ক
network-settings-gateway = গেটওয়ে
network-settings-done = সম্পন্ন হয়েছে
network-settings-wifi-password =
    .placeholder = পাসওয়ার্ড
network-settings-show-password = পাসওয়ার্ড দেখুন
network-settings-connect = সংযুক্ত করুন
network-settings-username = ব্যবহারকারীর নাম
network-settings-password = পাসওয়ার্ড
network-settings-router-ip = রাউটারের আইপি ঠিকানা
network-settings-dhcp-server = DHCP সার্ভার
network-settings-enable-wifi = ওয়াই-ফাই সক্ষম করুন
network-settings-network-name = নেটওয়ার্কের নাম (SSID)
wireless-connected = সংযুক্ত হয়েছে
wireless-icon =
    .alt = ওয়াই-ফাই নেটওয়ার্ক
network-settings-changing = নেটওয়ার্ক সেটিংস পরিবর্তন করা হচ্ছে। এটি এক মিনিট সময় নিতে পারে।
failed-ethernet-configure = ইথারনেট কনফিগার করতে ব্যর্থ হয়েছে।
failed-wifi-configure = ওয়াই-ফাই কনফিগার করতে ব্যর্থ হয়েছে।
failed-wan-configure = WAN কনফিগার করতে ব্যর্থ হয়েছে।
failed-lan-configure = LAN কনফিগার করতে ব্যর্থ হয়েছে।
failed-wlan-configure = WLANকনফিগার করতে ব্যর্থ হয়েছে।

## User Settings

create-user =
    .aria-label = নতুন ব্যবহারকারী যুক্ত করুন
user-settings-input-name =
    .placeholder = নাম
user-settings-input-email =
    .placeholder = ইমেইল
user-settings-input-password =
    .placeholder = পাসওয়ার্ড
user-settings-input-totp =
    .placeholder = 2FA কোড
user-settings-mfa-error = প্রমাণীকরণ কোডটি ভুল ছিল।
user-settings-mfa-enter-code = নীচে আপনার প্রমাণীকরণকারী অ্যাপ থেকে কোড প্রবেশ করান।
user-settings-mfa-verify = যাচাই করুন
user-settings-mfa-regenerate-codes = ব্যাকআপ কোডগুলি পুনরায় জেনারেট করুন
user-settings-input-new-password =
    .placeholder = নতুন পাসওয়ার্ড (ঐচ্ছিক):
user-settings-input-confirm-new-password =
    .placeholder = নতুন পাসওয়ার্ড নিশ্চিত করুন
user-settings-input-confirm-password =
    .placeholder = পাসওয়ার্ড নিশ্চিত করুন
user-settings-password-mismatch = পাসওয়ার্ড মিলছে না
user-settings-save = সংরক্ষণ করুন

## Adapter Settings

adapter-settings-no-adapters = কোনও অ্যাডাপ্টার উপস্থিত নেই।

## Authorization Settings

authorization-settings-no-authorizations = কোনও অনুমোদন নেই।

## Experiment Settings


## Localization Settings

localization-settings-language-region = ভাষা ও অঞ্চল
localization-settings-country = দেশ
localization-settings-timezone = সময় অঞ্চল
localization-settings-language = ভাষা
localization-settings-units = এককসমূহ
localization-settings-units-temperature = তাপমাত্রা
localization-settings-units-temperature-celsius = সেলসিয়াস (°C)
localization-settings-units-temperature-fahrenheit = ফারেনহাইট (°F)

## Update Settings

update-settings-update-now = এখনই আপডেট করুন
update-available = নতুন সংস্করণ বিদ্যমান আছে।
update-up-to-date = আপনার সিস্টেমটির মেয়াদ শেষ হয়েছে।
updates-not-supported = আপডেটগুলি এই প্ল্যাটফর্মটিতে কর্মক্ষম নয়।
update-settings-enable-self-updates = স্বয়ংক্রিয় আপডেটগুলি সক্ষম করুন
last-update = সর্বশেষ আপডেট
current-version = বর্তমান সংস্করণ
failed = ব্যর্থ হয়েছে
never = কখনো নয়
in-progress = চলমান…
restarting = পুনরায় চালু হচ্ছে ...
checking-for-updates = আপডেটগুলি অনুসন্ধান করা হচ্ছে ...
failed-to-check-for-updates = এই মুহুর্তে আপডেটগুলি পরীক্ষা করতে অক্ষম।

## Developer Settings

developer-settings-enable-ssh = SSH সক্রিয় করুন
developer-settings-view-internal-logs = অভ্যন্তরীণ লগগুলি দেখুন
developer-settings-create-local-authorization = স্থানীয় অনুমোদন তৈরি করুন

## Rules

add-rule =
    .aria-label = নতুন নিয়ম তৈরি করুন
rules = নিয়মাবলী
rules-create-rule-hint = কোনও নিয়ম তৈরি করা হয়নি। একটি নিয়ম তৈরি করতে + ক্লিক করুন।
rules-rule-name = নিয়মের নাম
rules-customize-rule-name-icon =
    .alt = নিয়মের নাম কাস্টমাইজ করুন
rules-rule-description = নিয়মের বিবরণ
rules-preview-button =
    .alt = প্রাকদর্শন
rules-delete-icon =
    .alt = মুছে ফেলুন
rules-drag-input-hint = ইনপুট হিসাবে ডিভাইস যুক্ত করুন
rules-drag-output-hint = আউটপুট হিসাবে ডিভাইস যুক্ত করুন
rules-scroll-left =
    .alt = বামদিকে স্ক্রোল করুন
rules-scroll-right =
    .alt = ডানদিকে স্ক্রোল করুন
rules-delete-dialog = আপনি কি এই নিয়ম স্থায়ীভাবে মুছে ফেলার বিষয়ে নিশ্চিত?
rules-delete-cancel =
    .value = বাতিল করুন
rules-delete-confirm =
    .value = নিয়ম মুছে ফেলুন
rule-invalid = অকার্যকর
rule-delete-prompt = আপনি কি এই নিয়ম স্থায়ীভাবে মুছে ফেলার বিষয়ে নিশ্চিত?
rule-delete-cancel-button =
    .value = বাতিল করুন
rule-delete-confirm-button =
    .value = নিয়ম মুছে ফেলুন
rule-select-property = প্রোপার্টি নির্বাচন করুন
rule-not = না
rule-event = ইভেন্ট
rule-action = করণীয়
rule-configure = কনফিগার…
rule-time-title = দিনের সময়
rule-notification = নোটিফিকেশন
notification-title = শিরোনাম
notification-message = বার্তা
notification-level = স্তর
notification-low = কম
notification-normal = স্বাভাবিক
notification-high = বেশি
rule-name = নিয়মের নাম

## Logs

add-log =
    .aria-label = নতুন লগ তৈরি করুন
logs = লগ
logs-create-log-hint = কোনও লগ তৈরি হয়নি। লগ তৈরি করতে + ক্লিক করুন।
logs-device = ডিভাইস
logs-device-select =
    .aria-label = লগ ডিভাইস
logs-property = প্রোপার্টি
logs-property-select =
    .aria-label = লগ প্রোপার্টি
logs-retention = ধারণ
logs-retention-length =
    .aria-label = লগ ধারণের দৈর্ঘ্য
logs-retention-unit =
    .aria-label = লগ ধারণ ইউনিট
logs-hours = ঘন্টা
logs-days = দিন
logs-weeks = সপ্তাহ
logs-save = সংরক্ষণ করুন
logs-remove-dialog-title = মুছে ফেলা হচ্ছে
logs-remove-dialog-warning = লগ অপসারণ করলে এর সমস্ত ডাটাও মুছে যাবে। আপনি কি এটি মুছে ফেলতে চান?
logs-remove = মুছে ফেলুন
logs-unable-to-create = লগ তৈরি করা যাচ্ছে না
logs-server-remove-error = সার্ভার ত্রুটি: লগ সরাতে অক্ষম

## Add New Things

add-thing-scanning-icon =
    .alt = স্ক্যান হচ্ছে
add-thing-scanning = নতুন ডিভাইসের জন্য স্ক্যান করা হচ্ছে ...
add-thing-add-by-url = URL দ্বারা যুক্ত করুন…
add-thing-done = সম্পন্ন হয়েছে
add-thing-cancel = বাতিল করুন

## Context Menu

context-menu-choose-icon = আইকন নির্বাচন করুন…
context-menu-save = সংরক্ষণ করুন
context-menu-remove = মুছে ফেলুন

## Capabilities

OnOffSwitch = চালু / বন্ধ সুইচ
MultiLevelSwitch = মাল্টি লেভেল স্যুইচ
ColorControl = রঙ নিয়ন্ত্রণ
ColorSensor = রঙ সেন্সর
EnergyMonitor = শক্তি মনিটর
BinarySensor = বাইনারি সেন্সর
SmartPlug = স্মার্ট প্লাগ
Light = হালকা
DoorSensor = ডোর সেন্সর
VideoCamera = ভিডিও ক্যামেরা
Camera = ক্যামেরা
TemperatureSensor = তাপমাত্রা সেন্সর
Thermostat = থার্মোস্টেট
Thing = জিনিস

## Properties

alarm = অ্যালার্ম
pushed = স্থগিত
on-off = চালু/বন্ধ
on = চালু
off = বন্ধ
power = ক্ষমতা
voltage = ভোল্টেজ
temperature = তাপমাত্রা
current = বর্তমান
frequency = ফ্রিকোয়েন্সি
color = রঙ
brightness = উজ্জ্বলতা
leak = ফুটো
dry = শুষ্ক
video-unsupported = দুঃখিত, ভিডিওটি আপনার ব্রাউজারে সমর্থিত নয়।
motion = গতি
no-motion = কোনও গতি নেই
open = খুলুন
closed = বন্ধ
unknown = অপরিচিত
active = সক্রিয়
inactive = নিষ্ক্রিয়

## Domain Setup

tunnel-setup-reclaim-domain = মনে হচ্ছে আপনি ইতিমধ্যে এই সাবডোমেন নিবন্ধন করেছেন। এটি পুনরুদ্ধার করতে <a data-l10n-name="tunnel-setup-reclaim-domain-click-here"> এখানে ক্লিক করুন </a>।
check-email-for-token = পুনরুদ্ধার টোকেনের জন্য দয়া করে আপনার ইমেল দেখুন এবং এটি উপরে পেস্ট করুন।
reclaim-failed = ডোমেন পুনরুদ্ধার করা যায়নি।
subdomain-already-used = এই সাবডোমেন ইতিমধ্যে ব্যবহৃত হয়েছে। দয়া করে অন্য একটি পছন্দ করুন।
invalid-subdomain = অকার্যকর সাবডোমেন।
invalid-email = অকার্যকর ইমেইল ঠিকানা।
invalid-reclamation-token = অকার্যকর পুনরুদ্ধার টোকেন।
domain-success = সফল! যতক্ষণ না আপনাকে রিডাইরেক্ট করছি অনুগ্রহ করে অপেক্ষা করুন…

## Booleans

true = সত্য
false = মিথ্যা

## Time

utils-now = এখন
minute = মিনিট
hour = ঘন্টা
day = দিন
week = সপ্তাহ

## Unit Abbreviations

abbrev-volt = V
abbrev-hertz = Hz
abbrev-amp = A
abbrev-watt = W
abbrev-kilowatt-hour = kW⋅h
abbrev-percent = %
abbrev-fahrenheit = °F
abbrev-celsius = °C
abbrev-kelvin = K
abbrev-meter = m
abbrev-kilometer = km
abbrev-day = d
abbrev-hour = h
abbrev-minute = m
abbrev-second = s
abbrev-millisecond = ms
abbrev-foot = ft

## New Thing View

new-thing-choose-icon = আইকন পছন্দ করুন ...
new-thing-save = সংরক্ষণ করুন
new-thing-pin =
    .placeholder = PIN দিন
new-thing-pin-error = ভুল PIN
new-thing-pin-invalid = অকার্যকর PIN
new-thing-cancel = বাতিল করুন
new-thing-submit = জমা দিন
new-thing-username =
    .placeholder = ইউজার নাম দিন
new-thing-password =
    .placeholder = পাসওয়ার্ড দিন
new-thing-saved = সংরক্ষণ করা হয়েছে
new-thing-done = সম্পন্ন হয়েছে

## New Web Thing View

loading = লোড হচ্ছে …
new-web-thing-from = থেকে

## Empty div Messages


## Add-on Settings

author-unknown = অপরিচিত
disable = নিষ্ক্রিয় করুন
enable = সক্রিয় করুন
by = দ্বারা
addon-update = হালনাগাদ
addon-remove = মুছে ফেলুন
addon-updating = হালনাগাদ হচ্ছে…
addon-updated = হালনাগাদ হয়েছে
addon-update-failed = ব্যর্থ হয়েছে
addon-config-applying = প্রয়োগ করা হচ্ছে…
addon-config-apply = প্রয়োগ করুন
addon-discovery-added = যোগ করা হয়েছে
addon-discovery-add = যোগ করুন
addon-discovery-installing = ইনস্টল হচ্ছে...
addon-discovery-failed = ব্যর্থ হয়েছে

## Page Titles

settings = সেটিংস
domain = ডোমেইন
localization = স্থানীয়করণ
authorizations = অনুমোদন
developer = ডেভেলপার
network = নেটওয়ার্ক
ethernet = ইথারনেট
wifi = Wi-Fi
icon = আইকন

## Errors

unknown-state = অজানা অবস্থা।
more-information = আরো তথ্য
invalid-file = অকার্যকর ফাইল।
failed-read-file = ফাইলটি পড়তে ব্যর্থ হয়েছে।
failed-save = সংরক্ষণ করতে ব্যর্থ হয়েছে.

## Schema Form


## Icon Sources

thing-icons-thing-src = /images/thing-icons/thing.svg

## Login Page

login-title = লগইন — { -webthings-gateway-brand }
login-log-in = লগ ইন

## Create First User Page

signup-title = ব্যবহারকারী তৈরি করুন — { -webthings-gateway-brand }
signup-welcome = স্বাগতম
signup-create-account = আপনার প্রথম ইউজার অ্যাকাউন্ট তৈরি করুন:
signup-password-mismatch = পাসওয়ার্ড মিলছে না
signup-next = পরবর্তী

## Tunnel Setup Page

tunnel-setup-title = ওয়েব ঠিকানা নির্বাচন করুন — { -webthings-gateway-brand }
tunnel-setup-welcome = স্বাগতম
tunnel-setup-input-subdomain =
    .placeholder = সাবডোমেন
tunnel-setup-opt-in = নতুন বৈশিষ্ট্য এবং অবদানের সুযোগ সম্পর্কে দয়া করে আমাকে আপডেট রাখুন।
tunnel-setup-privacy-policy = গোপনীয়তা নীতি
tunnel-setup-error = সাবডোমেন সেট আপ করার সময় একটি ত্রুটি দেখা দিয়েছে।
tunnel-setup-create = তৈরি করুন
tunnel-setup-skip = এড়িয়ে যান

## Authorize Page

authorize-title = অনুমোদনের অনুরোধ — { -webthings-gateway-brand }
authorize-authorization-request = অনুমোদনের অনুরোধ
# Use <<domain>> to indicate where the domain should be placed
authorize-source = <<domain>> থেকে
authorize-monitor-and-control = নিরীক্ষণ এবং নিয়ন্ত্রণ
authorize-monitor = নিরীক্ষণ
authorize-allow-all = সব কিছুর জন্য অনুমতি দিন
authorize-allow =
    .value = অনুমতি দিন
authorize-deny = প্রত্যাখ্যান করুন

## Local Token Page

local-token-title = স্থানীয় টোকেন পরিষেবা — { -webthings-gateway-brand }

## Router Setup Page

router-setup-title = রাউটার সেটআপ — { -webthings-gateway-brand }
router-setup-header = একটি নতুন Wi-Fi নেটওয়ার্ক তৈরি করুন
router-setup-input-ssid =
    .placeholder = নেটওয়ার্কের নাম
router-setup-input-password =
    .placeholder = পাসওয়ার্ড
router-setup-input-confirm-password =
    .placeholder = পাসওয়ার্ড নিশ্চিত করুন
router-setup-create =
    .value = তৈরি করুন
router-setup-password-mismatch = পাসওয়ার্ড অবশ্যই মিলতে হবে।

## Wi-Fi Setup Page

wifi-setup-title = Wi-Fi সেটআপ — { -webthings-gateway-brand }
wifi-setup-header = Wi-Fi নেটওয়ার্কে সংযোগ স্থাপন করবেন?
wifi-setup-input-password =
    .placeholder = পাসওয়ার্ড
wifi-setup-show-password = পাসওয়ার্ড দেখান
wifi-setup-connect =
    .value = যুক্ত
wifi-setup-network-icon =
    .alt = Wi-Fi নেটওয়ার্ক
wifi-setup-skip = এড়িয়ে যান

## Connecting to Wi-Fi Page

connecting-header = Wi-Fi এর সাথে সংযুক্ত হচ্ছে ...
connecting-header-skipped = Wi-Fi সেটআপ এড়িয়ে গেছে

## Creating Wi-Fi Network Page

creating-header = Wi-Fi নেটওয়ার্ক তৈরি করা হচ্ছে ...

## UI Updates

ui-update-close = বন্ধ

## General Terms

ok = ঠিক আছে
ellipsis = …
event-log = ইভেন্ট লগ
disconnected = সংযোগ বিচ্ছিন্ন হয়েছে
processing = প্রক্রিয়াকরণ চলছে…
submit = জমা দিন

## Top-Level Buttons

back-button =
    .aria-label = ফিরে যান
overflow-button =
    .aria-label = অতিরিক্ত কার্যকলাপ
submit-button =
    .aria-label = জমা দিন
save-button =
    .aria-label = সংরক্ষণ করুন
