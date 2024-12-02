export CARGO_PROFILE_RELEASE_STRIP=symbols
export CARGO_PROFILE_RELEASE_LTO=fat

:: check licenses
cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

:: build
cargo install --bins --no-track --locked --root "%PREFIX%" --path . || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
