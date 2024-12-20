# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Classes

* [`postfix`](#postfix): configure postfix, main class
* [`postfix::config::main`](#postfix--config--main): configures the main.cf file  This class is included by postfix::server and postfix::satellite to write the main.cf file
* [`postfix::config::master`](#postfix--config--master): configure master.cf
* [`postfix::service`](#postfix--service): create the postfix Service

### Defined types

* [`postfix::config::service`](#postfix--config--service): define a service in master.cf file of postfix  See master(5) for details
* [`postfix::map`](#postfix--map): this defines a map for postfix  you can either use $source or $content parameter or use your own concat::fragment resources to add content to

## Classes

### <a name="postfix"></a>`postfix`

configure postfix, main class

#### Examples

##### 

```puppet
include postfix
```

#### Parameters

The following parameters are available in the `postfix` class:

* [`packages`](#-postfix--packages)
* [`package_ensure`](#-postfix--package_ensure)
* [`use_profile`](#-postfix--use_profile)
* [`parameters`](#-postfix--parameters)
* [`parameters_profiles`](#-postfix--parameters_profiles)
* [`services`](#-postfix--services)
* [`services_profiles`](#-postfix--services_profiles)
* [`maps`](#-postfix--maps)
* [`maps_profiles`](#-postfix--maps_profiles)
* [`map_dir`](#-postfix--map_dir)
* [`ssl_dir`](#-postfix--ssl_dir)
* [`owner`](#-postfix--owner)
* [`group`](#-postfix--group)
* [`mode`](#-postfix--mode)
* [`postmap_command`](#-postfix--postmap_command)
* [`create_resources`](#-postfix--create_resources)
* [`master_cf_file`](#-postfix--master_cf_file)
* [`main_cf_file`](#-postfix--main_cf_file)

##### <a name="-postfix--packages"></a>`packages`

Data type: `Array`

packages to install

Default value: `['postfix']`

##### <a name="-postfix--package_ensure"></a>`package_ensure`

Data type: `String`

defaults to 'installed'

Default value: `'installed'`

##### <a name="-postfix--use_profile"></a>`use_profile`

Data type: `String[1]`

profile for the configuration to use.

Default value: `'none'`

##### <a name="-postfix--parameters"></a>`parameters`

Data type: `Hash`

Hash of parameters for server
Remark: in hiera this parameter is hash merged

Default value: `{}`

##### <a name="-postfix--parameters_profiles"></a>`parameters_profiles`

Data type: `Hash`

a Hash of profiles for parameters (see above)
if $postfix::use_profile is set then and
$parameters_profiles["$postfix::use_profile"] exists,
the profile is merged with $postfix::parameters.
Like this several config profiles can be defined
(eg. mailserver, mail satellite, etc.)
Remark: in hiera this parameter is hash merged

Default value: `{}`

##### <a name="-postfix--services"></a>`services`

Data type: `Hash`

Hash of services for server
Defaults to {}
Remark: in hiera this parameter is hash merged

Default value: `{}`

##### <a name="-postfix--services_profiles"></a>`services_profiles`

Data type: `Hash`

a Hash of profiles for services (see above)
if $postfix::use_profile is set then and
$services_profiles["$postfix::use_profile"] exists,
the profile is merged with $postfix::services.
Like this several config profiles can be defined
(eg. mailserver, mail satellite, etc.)
Remark: in hiera this parameter is hash merged

Default value: `{}`

##### <a name="-postfix--maps"></a>`maps`

Data type: `Hash`

Hash of maps to generate
Defaults to {}
Remark: in hiera this parameter is hash merged

Default value: `{}`

##### <a name="-postfix--maps_profiles"></a>`maps_profiles`

Data type: `Hash`

a Hash of profiles for maps (see above)
if $postfix::use_profile is set then and
$maps_profiles["$postfix::use_profile"] exists,
the profile is merged with $postfix::maps.
Like this several config profiles can be defined
(eg. mailserver, mail satellite, etc.)
Remark: in hiera this parameter is hash merged

Default value: `{}`

##### <a name="-postfix--map_dir"></a>`map_dir`

Data type: `String`

directory for maps to create

Default value: `'/etc/postfix/maps'`

##### <a name="-postfix--ssl_dir"></a>`ssl_dir`

Data type: `String`

directory for ssl to create

Default value: `'/etc/postfix/ssl'`

##### <a name="-postfix--owner"></a>`owner`

Data type: `String`

file and directory owner

Default value: `'root'`

##### <a name="-postfix--group"></a>`group`

Data type: `String`

file and directory group

Default value: `'root'`

##### <a name="-postfix--mode"></a>`mode`

Data type: `String`

file mode

Default value: `'0644'`

##### <a name="-postfix--postmap_command"></a>`postmap_command`

Data type: `String`

the postmap command to use

Default value: `'/usr/sbin/postmap'`

##### <a name="-postfix--create_resources"></a>`create_resources`

Data type: `Hash`

generic create_resources (for certificates etc)

Default value: `{}`

##### <a name="-postfix--master_cf_file"></a>`master_cf_file`

Data type: `String`

filename and path to master.cf file

Default value: `'/etc/postfix/master.cf'`

##### <a name="-postfix--main_cf_file"></a>`main_cf_file`

Data type: `String`

filename and path to main.cf file

Default value: `'/etc/postfix/main.cf'`

### <a name="postfix--config--main"></a>`postfix::config::main`

configures the main.cf file

This class is included by
postfix::server and
postfix::satellite to write the main.cf file

#### Parameters

The following parameters are available in the `postfix::config::main` class:

* [`main_cf_file`](#-postfix--config--main--main_cf_file)
* [`owner`](#-postfix--config--main--owner)
* [`group`](#-postfix--config--main--group)
* [`mode`](#-postfix--config--main--mode)
* [`parameters`](#-postfix--config--main--parameters)

##### <a name="-postfix--config--main--main_cf_file"></a>`main_cf_file`

Data type: `String`

name and path of the main.cf file

##### <a name="-postfix--config--main--owner"></a>`owner`

Data type: `String`

owner of the main.cf file

##### <a name="-postfix--config--main--group"></a>`group`

Data type: `String`

group of the main.cf file

##### <a name="-postfix--config--main--mode"></a>`mode`

Data type: `String`

mode of the main.cf file

##### <a name="-postfix--config--main--parameters"></a>`parameters`

Data type: `Hash`

The parameters to set in the main.cf file
Defaults to {}

Default value: `{}`

### <a name="postfix--config--master"></a>`postfix::config::master`

configure master.cf

#### Parameters

The following parameters are available in the `postfix::config::master` class:

* [`master_cf_file`](#-postfix--config--master--master_cf_file)
* [`owner`](#-postfix--config--master--owner)
* [`group`](#-postfix--config--master--group)
* [`mode`](#-postfix--config--master--mode)
* [`services`](#-postfix--config--master--services)

##### <a name="-postfix--config--master--master_cf_file"></a>`master_cf_file`

Data type: `String`

name and path for master.cf file

##### <a name="-postfix--config--master--owner"></a>`owner`

Data type: `String`

owner of master.cf

##### <a name="-postfix--config--master--group"></a>`group`

Data type: `String`

group of master.cf

##### <a name="-postfix--config--master--mode"></a>`mode`

Data type: `String`

file mode of master.cf

##### <a name="-postfix--config--master--services"></a>`services`

Data type: `Hash`

services to configure (also see README)

Default value: `{}`

### <a name="postfix--service"></a>`postfix::service`

create the postfix Service

#### Parameters

The following parameters are available in the `postfix::service` class:

* [`service_name`](#-postfix--service--service_name)
* [`service_ensure`](#-postfix--service--service_ensure)
* [`service_enable`](#-postfix--service--service_enable)
* [`disabled_services`](#-postfix--service--disabled_services)
* [`exec_postfix_enable`](#-postfix--service--exec_postfix_enable)
* [`sync_chroot`](#-postfix--service--sync_chroot)
* [`ensure_syslog_flag`](#-postfix--service--ensure_syslog_flag)

##### <a name="-postfix--service--service_name"></a>`service_name`

Data type: `String`

The name of the service

Default value: `'postfix'`

##### <a name="-postfix--service--service_ensure"></a>`service_ensure`

Data type: `String`

state of the service.

Default value: `'running'`

##### <a name="-postfix--service--service_enable"></a>`service_enable`

Data type: `Boolean`

if service should be enabled

Default value: `true`

##### <a name="-postfix--service--disabled_services"></a>`disabled_services`

Data type: `Array`

Array of Services to stop

Default value: `[]`

##### <a name="-postfix--service--exec_postfix_enable"></a>`exec_postfix_enable`

Data type: `Boolean`

if set to true, we run postfix-enable

Default value: `false`

##### <a name="-postfix--service--sync_chroot"></a>`sync_chroot`

Data type: `Optional[String[1]]`

if set to a path, the according chroot
is synced.

Default value: `undef`

##### <a name="-postfix--service--ensure_syslog_flag"></a>`ensure_syslog_flag`

Data type: `Boolean`

if set to true, and sync_chroot is choosen,
a flag is set to allow logging from chroot
this is very OpenBSD specific !

Default value: `false`

## Defined types

### <a name="postfix--config--service"></a>`postfix::config::service`

define a service in master.cf file of postfix

See master(5) for details

#### Parameters

The following parameters are available in the `postfix::config::service` defined type:

* [`type`](#-postfix--config--service--type)
* [`command`](#-postfix--config--service--command)
* [`args`](#-postfix--config--service--args)
* [`service_names`](#-postfix--config--service--service_names)
* [`priv`](#-postfix--config--service--priv)
* [`unpriv`](#-postfix--config--service--unpriv)
* [`chroot`](#-postfix--config--service--chroot)
* [`wakeup`](#-postfix--config--service--wakeup)
* [`maxproc`](#-postfix--config--service--maxproc)
* [`active`](#-postfix--config--service--active)
* [`comments`](#-postfix--config--service--comments)
* [`order`](#-postfix--config--service--order)
* [`master_cf_file`](#-postfix--config--service--master_cf_file)

##### <a name="-postfix--config--service--type"></a>`type`

Data type: `String`

Specify the service type. one of:
inet, unix, fifo, pass.
defaults to 'unix'

Default value: `'unix'`

##### <a name="-postfix--config--service--command"></a>`command`

Data type: `String`

The command to be executed.
defaults to $title

Default value: `$title`

##### <a name="-postfix--config--service--args"></a>`args`

Data type: `Array`

Array of commands arguments

Default value: `[]`

##### <a name="-postfix--config--service--service_names"></a>`service_names`

Data type: `Array`

Array of service names to configure.
defaults to [$title]

Default value: `[$title]`

##### <a name="-postfix--config--service--priv"></a>`priv`

Data type: `String`

Whether or not access is restricted to the mail system.
defaults '-' (use built-in default)

Default value: `'-'`

##### <a name="-postfix--config--service--unpriv"></a>`unpriv`

Data type: `String`

Whether the service runs with root privileges or as
the owner of the Postfix system.
defaults '-' (use built-in default)

Default value: `'-'`

##### <a name="-postfix--config--service--chroot"></a>`chroot`

Data type: `String`

Whether or not the service runs chrooted to the mail
queue directory.
defaults '-' (use built-in default)

Default value: `'-'`

##### <a name="-postfix--config--service--wakeup"></a>`wakeup`

Data type: `String`

Wake up time
defaults 'n' (default for postfix >= 3.0)

Default value: `'-'`

##### <a name="-postfix--config--service--maxproc"></a>`maxproc`

Data type: `String`

The maximum number of processes that may execute
this service simultaneously
defaults 'n' (default for postfix >= 3.0)

Default value: `'-'`

##### <a name="-postfix--config--service--active"></a>`active`

Data type: `Boolean`

if false, the service will not be activated (commented out)
default: true,

Default value: `true`

##### <a name="-postfix--config--service--comments"></a>`comments`

Data type: `Array`

Array of comments to print in front of the service definition.
defaults to [] (no comment)

Default value: `[]`

##### <a name="-postfix--config--service--order"></a>`order`

Data type: `String`

order of the fragment (defaults to '55')

Default value: `'55'`

##### <a name="-postfix--config--service--master_cf_file"></a>`master_cf_file`

Data type: `String`

target

### <a name="postfix--map"></a>`postfix::map`

this defines a map for postfix

you can either use $source or $content
parameter or use your own concat::fragment
resources to add content to the map.

#### Parameters

The following parameters are available in the `postfix::map` defined type:

* [`map_dir`](#-postfix--map--map_dir)
* [`postmap_command`](#-postfix--map--postmap_command)
* [`map_name`](#-postfix--map--map_name)
* [`type`](#-postfix--map--type)
* [`source`](#-postfix--map--source)
* [`contents`](#-postfix--map--contents)
* [`owner`](#-postfix--map--owner)
* [`group`](#-postfix--map--group)
* [`mode`](#-postfix--map--mode)

##### <a name="-postfix--map--map_dir"></a>`map_dir`

Data type: `String`

the directory to create the map in

##### <a name="-postfix--map--postmap_command"></a>`postmap_command`

Data type: `String`

postmap command

##### <a name="-postfix--map--map_name"></a>`map_name`

Data type: `String`

The name of the map defaults to $title

Default value: `$title`

##### <a name="-postfix--map--type"></a>`type`

Data type: `String`

the type of the map
defaults to hash

Default value: `'hash'`

##### <a name="-postfix--map--source"></a>`source`

Data type: `Optional[String[1]]`

source of the map
defaults to ''

Default value: `undef`

##### <a name="-postfix--map--contents"></a>`contents`

Data type: `Array`

Array of lines to add to the map
defaults to []

Default value: `[]`

##### <a name="-postfix--map--owner"></a>`owner`

Data type: `String`

owner of the map file

##### <a name="-postfix--map--group"></a>`group`

Data type: `String`

group of the map file

##### <a name="-postfix--map--mode"></a>`mode`

Data type: `String`

file mode of the map file

