#
# Cookbook Name:: pastec
# Recipe:: default
#
# Copyright (c) 2016 Michael F. Weinberg, All Rights Reserved.

include_recipe 'pastec::install'

include_recipe 'pastec::nginx'
