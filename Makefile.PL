use inc::Module::Install;
use Module::Install::Repository;
use Module::Install::ReadmePodFromPod;
name 'Module-Starter-VC';
all_from 'lib/Module/Starter/VC/Git.pm';
readme_pod_from 'lib/Module/Starter/VC/Git.pm';

requires 'Module::Starter' => '1.60';
requires 'Cwd::Guard'      => '0';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
