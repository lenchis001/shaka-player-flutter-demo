rm -rf build/web/*

fvm flutter pub get
fvm flutter build web --web-renderer html

"$TIZEN_SDK/tools/ide/bin/tizen" build-web -- "./build/web"
"$TIZEN_SDK/tools/ide/bin/tizen" package -t wgt -- "./build/web/.buildResult" -o "./build/web"
"$TIZEN_SDK/tools/ide/bin/tizen" install -- . -n build/web/Shaka.wgt
"$TIZEN_SDK/tools/ide/bin/tizen" run -p CU6377fEVI.player