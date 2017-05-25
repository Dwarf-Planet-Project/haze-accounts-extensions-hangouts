Name:       haze-accounts-extensions-hangouts

Summary:    Extensions plugins for Telepathy Haze library purple-hangouts
Version:    0.2
Release:    1
Group:      System/Application
License:    GPL3
Source0:    %name-%version.tar.gz
Requires:   libpurple
Requires:   telepathy-haze
Requires:   jolla-settings-accounts >= 0.2.27
Requires:   purple-hangouts
BuildArch:  noarch

%description
Extensions plugins for Telepathy Haze library purple-hangouts

%prep
%setup -q

# >> setup
# << setup

%build
# >> build pre
# << build pre

# >> build post
# << build post

%install
rm -rf %{buildroot}

mkdir -p %{buildroot}%{_datadir}/accounts
mkdir -p %{buildroot}%{_datadir}/accounts/providers
mkdir -p %{buildroot}%{_datadir}/accounts/services
mkdir -p %{buildroot}%{_datadir}/accounts/ui

install -m 644 src/hangouts.provider %{buildroot}%{_datadir}/accounts/providers
install -m 644 src/hangouts.service %{buildroot}%{_datadir}/accounts/services
install -m 644 src/hangouts.qml %{buildroot}%{_datadir}/accounts/ui
install -m 644 src/hangouts-settings.qml %{buildroot}%{_datadir}/accounts/ui
install -m 644 src/hangouts-update.qml %{buildroot}%{_datadir}/accounts/ui
install -m 644 src/HangoutsCommon.qml %{buildroot}%{_datadir}/accounts/ui
install -m 644 src/HangoutsSettingsDisplay.qml %{buildroot}%{_datadir}/accounts/ui

# >> install pre
# << install pre

# >> install post
# << install post

%files
%defattr(-,root,root,-)
%{_datadir}/accounts/providers/*
%{_datadir}/accounts/services/*
%{_datadir}/accounts/ui/*

%clean
rm -rf %{buildroot}
