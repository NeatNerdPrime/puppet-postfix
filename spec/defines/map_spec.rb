
require 'spec_helper'

describe 'postfix::map' do
  let(:pre_condition) { 'service {"postfix": }' }
  let :default_params do
    { map_dir: '/etc/postfix/maps',
      postmap_command: '/usr/sbin/postmap',
      owner: 'root',
      group: 'root',
      mode: '0644' }
  end

  shared_examples 'postfix::map define' do
    context 'it compiles with all dependencies' do
      it { is_expected.to compile.with_all_deps }
    end

    context 'it includes map file' do
      it {
        is_expected.to contain_concat('/etc/postfix/maps/' + title)
          .with(owner: 'root',
                mode: '0644')
          .with_notify('Service[postfix]')
      }
    end

    context 'rebuild map' do
      it {
        is_expected.to contain_exec('rebuild map ' + title)
          .with_command(%r{postmap})
          .with_require('Concat[/etc/postfix/maps/' + title + ']')
          .with_notify('Service[postfix]')
          .with_unless(%r{/etc/postfix/maps/#{title}.db})
      }
    end
  end
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'whith defaults' do
        let(:title) { 'mymap' }
        let(:params) { default_params }

        it_behaves_like 'postfix::map define'
      end

      context 'whith content defined' do
        let(:title) { 'map_with_content' }
        let :params do
          default_params.merge(contents: ['blah1', 'blah2'])
        end

        it_behaves_like 'postfix::map define'
        it {
          is_expected.to contain_concat__fragment('postfix::map: content fragment ' + title)
            .with_target('/etc/postfix/maps/' + title)
            .with_content("blah1\nblah2")
        }
      end

      context 'whith source defined' do
        let(:title) { 'map_with_source' }
        let :params do
          default_params.merge(source: 'a_source')
        end

        it_behaves_like 'postfix::map define'
        it {
          is_expected.to contain_concat__fragment('postfix::map: source fragment ' + title)
            .with_target('/etc/postfix/maps/' + title)
            .with_source('a_source')
        }
      end

      context 'whith btree map type' do
        let(:title) { 'dbm_map_type' }
        let :params do
          default_params.merge(type: 'btree')
        end

        it_behaves_like 'postfix::map define'

        context 'rebuild btree map' do
          it {
            is_expected.to contain_exec('rebuild map dbm_map_type')
              .with_command('/usr/sbin/postmap btree:/etc/postfix/maps/dbm_map_type')
          }
        end
      end

      context 'whith custom map path and name' do
        let(:title) { 'custom_map_path_and_name' }
        let :params do
          default_params.merge(
            map_dir: '/blah/fasel',
            map_name: 'myname',
          )
        end

        context 'it includes map file' do
          it {
            is_expected.to contain_concat('/blah/fasel/myname')
              .with(owner: 'root',
                    group: 'root',
                    mode: '0644')
              .with_notify('Service[postfix]')
          }
        end

        context 'rebuild map' do
          it {
            is_expected.to contain_exec('rebuild map custom_map_path_and_name')
              .with_command('/usr/sbin/postmap hash:/blah/fasel/myname')
              .with_require('Concat[/blah/fasel/myname]')
              .with_notify('Service[postfix]')
              .with_unless(%r{/blah/fasel/myname.(db|cdb|pag)})
          }
        end
      end

      context 'whith custom map path' do
        let(:title) { 'custom_map_path' }
        let :params do
          default_params.merge(
            map_dir: '/blah/fasel',
          )
        end

        context 'it includes map file' do
          it {
            is_expected.to contain_concat('/blah/fasel/custom_map_path')
              .with(owner: 'root',
                    group: 'root',
                    mode: '0644')
              .with_notify('Service[postfix]')
          }
        end

        context 'rebuild map' do
          it {
            is_expected.to contain_exec('rebuild map custom_map_path')
              .with_command('/usr/sbin/postmap hash:/blah/fasel/custom_map_path')
              .with_require('Concat[/blah/fasel/custom_map_path]')
              .with_notify('Service[postfix]')
              .with_unless(%r{/blah/fasel/#{title}.db})
          }
        end
      end

      context 'whith custom postmap' do
        let(:title) { 'custom_postmap' }

        let :params do
          default_params.merge(
            postmap_command: 'my_postmap_command',
          )
        end

        context 'rebuild map' do
          it {
            is_expected.to contain_exec('rebuild map custom_postmap')
              .with_command('my_postmap_command hash:/etc/postfix/maps/custom_postmap')
              .with_require('Concat[/etc/postfix/maps/custom_postmap]')
              .with_notify('Service[postfix]')
              .with_unless(%r{/etc/postfix/maps/#{title}.db})
          }
        end
      end

      context 'whith unknown map type' do
        let(:title) { 'unknown_map_type' }

        let :params do
          default_params.merge(
            type: 'fifo',
          )
        end

        it {
          is_expected.not_to contain_exec('rebuild map ' + title)
        }
      end
    end
  end
end
