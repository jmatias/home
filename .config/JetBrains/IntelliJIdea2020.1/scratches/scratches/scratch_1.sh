#!/usr/bin/env bash
#git remote add -f old_rm git@github.com:***REMOVED***/***REMOVED***-rm.git

git remote add -f old_office-addin git@github.com:***REMOVED***/***REMOVED***-office-addin.git && mkdir office-addin_repo
git remote add -f old_templates git@github.com:***REMOVED***/***REMOVED***-templates.git && mkdir templates_repo
git remote add -f old_setup git@github.com:***REMOVED***/***REMOVED***-setup.git && mkdir setup_repo
#git remote add -f old_ git@github.com:***REMOVED***/***REMOVED***-.git && mkdir _repo

git remote add -f old_net git@github.com:***REMOVED***/***REMOVED***-net.git && mkdir net_repo
git merge --allow-unrelated-histories old_net/hotfix
ls -A | grep -v rm_repo| grep -v Jenkins_global | grep -v office-addin_repo| grep -v templates_repo| grep -v setup_repo| grep -v perf_repo | grep -v phone_repo | grep -v win_repo | grep -v net_repo  | grep -v interface_repo | grep -v .idea | grep -v connectors_repo  | xargs -t -i git mv {} net_repo
git commit -m "Merged net repository."


git remote add -f old_win git@github.com:***REMOVED***/***REMOVED***-win.git && mkdir win_repo
git merge --allow-unrelated-histories old_win/hotfix
ls -A | grep -v rm_repo| grep -v Jenkins_global | grep -v office-addin_repo| grep -v templates_repo| grep -v setup_repo| grep -v perf_repo | grep -v phone_repo | grep -v win_repo | grep -v net_repo  | grep -v interface_repo | grep -v .idea | grep -v connectors_repo  | xargs -t -i git mv {} win_repo
git commit -m "Merged win repository."

git remote add -f old_interface git@github.com:***REMOVED***/***REMOVED***-interface.git && mkdir interface_repo
git merge --allow-unrelated-histories old_interface/hotfix
ls -A | grep -v rm_repo | grep -v Jenkins_global |  grep -v .idea | grep -v .vscode | grep -v office-addin_repo| grep -v templates_repo| grep -v setup_repo| grep -v perf_repo | grep -v phone_repo | grep -v win_repo | grep -v net_repo  | grep -v interface_repo | grep -v .idea | grep -v connectors_repo  | xargs -t -i git mv {} interface_repo
git commit -m "Merged interface repository."


git remote add -f old_connectors git@github.com:***REMOVED***/***REMOVED***-connectors.git && mkdir connectors_repo
git merge --allow-unrelated-histories old_connectors/hotfix
ls -A | grep -v rm_repo| grep -v Jenkins_global | grep -v office-addin_repo| grep -v templates_repo| grep -v setup_repo| grep -v perf_repo | grep -v phone_repo \
| grep -v win_repo | grep -v net_repo  | grep -v interface_repo | grep -v .idea | grep -v connectors_repo  | xargs -t -i git mv {} connectors_repo
git commit -m "Merged win repository."

git merge --allow-unrelated-histories old_rm/hotfix  && mkdir rm_repo
ls -A | grep -v rm_repo| grep -v Jenkins_global | grep -v office-addin_repo| grep -v templates_repo| grep -v setup_repo| grep -v perf_repo | grep -v phone_repo | grep -v win_repo | grep -v net_repo  | grep -v interface_repo | grep -v .idea | grep -v connectors_repo  | xargs -t -i git mv {} rm_repo
git commit -m "Merged rm repository."

git merge --allow-unrelated-histories old_office-addin/hotfix
ls -A | grep -v rm_repo| grep -v Jenkins_global | grep -v office-addin_repo| grep -v templates_repo| grep -v setup_repo| grep -v perf_repo | grep -v phone_repo | grep -v win_repo | grep -v net_repo  | grep -v interface_repo | grep -v .idea | grep -v connectors_repo  | xargs -t -i git mv {} office-addin_repo
git commit -m "Merged office-addin repository."

git merge --allow-unrelated-histories old_templates/hotfix && \
ls -A | grep -v rm_repo| grep -v Jenkins_global | grep -v office-addin_repo| grep -v templates_repo| grep -v setup_repo| grep -v perf_repo | grep -v phone_repo | grep -v win_repo | grep -v net_repo  | grep -v interface_repo | grep -v .idea | grep -v connectors_repo  | xargs -t -i git mv {} templates_repo && \
git commit -m "Merged templates repository."


git merge --allow-unrelated-histories old_setup/hotfix && \
ls -A | grep -v rm_repo| grep -v Jenkins_global | grep -v office-addin_repo| grep -v templates_repo| grep -v setup_repo| grep -v perf_repo | grep -v phone_repo | grep -v win_repo | grep -v net_repo  | grep -v interface_repo | grep -v connectors_repo  | xargs -t -i git mv {} setup_repo
git commit -m "Merged setup repository."

git mv net_repo net && git mv win_repo win && git mv connectors_repo connectors && git mv interface_repo interface && git mv office-addin_repo office-addin && git mv perf_repo perf && git mv templates_repo templates && git mv phone_repo phone && git mv setup_repo setup && git mv rm_repo rm



git mv win win_repo && git mv net net_repo && git mv interface interface_repo

git mv win_repo win && git mv net_repo net && git mv interface_repo interface && git mv connectors_repo connectors



git checkout -b master
git merge -s recursive -Xsubtree=net old_net/master
git merge -s recursive -Xsubtree=win old_win/master
git merge -s recursive -Xsubtree=connectors old_connectors/master
git merge -s recursive -Xsubtree=interface old_interface/master
git merge -s recursive -Xsubtree=setup old_setup/master
git merge -s recursive -Xsubtree=phone old_phone/master
git merge -s recursive -Xsubtree=templates old_templates/master
git merge -s recursive -Xsubtree=office-addin old_office-addin/master


git checkout -b hotfix
git merge -s recursive -Xsubtree=net old_net/hotfix
git merge -s recursive -Xsubtree=win old_win/hotfix
git merge -s recursive -Xsubtree=connectors old_connectors/hotfix
git merge -s recursive -Xsubtree=interface old_interface/hotfix
git merge -s recursive -Xsubtree=setup old_setup/hotfix
git merge -s recursive -Xsubtree=phone old_phone/hotfix
git merge -s recursive -Xsubtree=templates old_templates/hotfix
git merge -s recursive -Xsubtree=office-addin old_office-addin/hotfix

git checkout -b release
git merge -s recursive -Xsubtree=net old_net/release
git merge -s recursive -Xsubtree=win old_win/release
git merge -s recursive -Xsubtree=connectors old_connectors/release
git merge -s recursive -Xsubtree=interface old_interface/release
git merge -s recursive -Xsubtree=setup old_setup/release
git merge -s recursive -Xsubtree=phone old_phone/release
git merge -s recursive -Xsubtree=templates old_templates/release
git merge -s recursive -Xsubtree=office-addin old_office-addin/release


git checkout -b develop
git merge -s recursive -Xsubtree=net old_net/develop
git merge -s recursive -Xsubtree=win old_win/develop
git merge -s recursive -Xsubtree=connectors old_connectors/develop
git merge -s recursive -Xsubtree=interface old_interface/develop
git merge -s recursive -Xsubtree=setup old_setup/develop
git merge -s recursive -Xsubtree=phone old_phone/develop
git merge -s recursive -Xsubtree=templates old_templates/develop
git merge -s recursive -Xsubtree=office-addin old_office-addin/develop