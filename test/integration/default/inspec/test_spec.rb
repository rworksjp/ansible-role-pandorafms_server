# encoding: utf-8

ps_pkgname = attribute("pandorafms_server_package_name", default: "XXX")
ps_svc_name = "pandora_server"
ps_version = attribute("pandorafms_server_version", default: nil)
mysql_svc_name = attribute("mysql_service_name", default: "XXX")

control 'attributes' do
  describe ps_pkgname, "(value of `ps_pkgname' variable) " do
    it { should_not eq "XXX" }
  end
  describe mysql_svc_name, "(value of `mysql_svc_name' variable)" do
    it { should_not eq "XXX" }
  end
end

control 'required-services' do
  describe service(mysql_svc_name) do
    it { should be_running }
  end
end

describe package(ps_pkgname) do
  it { should be_installed }
end

control 'package-version' do
  only_if('package_version is specified') do
    not ps_version.nil?
  end

  describe package(ps_pkgname) do
    its('version') { should include ps_version }
  end
end

describe service(ps_svc_name) do
  it { should be_running }
end
