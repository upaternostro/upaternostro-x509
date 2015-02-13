# x509

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with x509](#setup)
    * [What x509 affects](#what-x509-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with x509](#beginning-with-x509)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Manage X.509 certificates and PEM private keys on Debian systems. Fully Hiera integrated,
but lives without if you store certs nd keys in the module directory.

## Module Description

This module configures the /etc/x509 directory as per-Debian design [https://wiki.debian.org/X.509]

You can use Hiera to store certs and keys, or you can store those in the module
directory.

The module defines three resources: ca, cert and key, one for each of the cited Debian
directory structure.

## Setup

### What x509 affects

* Create /etc/x509 and its subdirs
* Populate the directory tree with certificates ans private keys

### Beginning with x509

Install via module manager:

puppet module install upaternostro-x509

## Usage

x509::ca { 'pki.yourdomain.com' } -> /etc/x509/ca/pki.yourdomain.com.crt
x509::cert { 'www.yourdomain.com' } -> /etc/x509/certs/www.yourdomain.com.crt
x509::key { 'www.yourdomain.com' } -> /etc/x509/keys/www.yourdomain.com.key

## Reference

x509
ca
cert
key

## Limitations

Tested on Debian 7

## Development

Fork me on GitHub! https://github.com/upaternostro/upaternostro-x509

