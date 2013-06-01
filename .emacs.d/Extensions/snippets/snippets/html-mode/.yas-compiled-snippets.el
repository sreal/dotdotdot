;;; Compiled snippets and support files for `html-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'html-mode
                     '(("ng" "ng-app${1:=\"${2:module}\"}$0`\n(ng-snip/docs \"ng-app\")\n(ng-snip/maybe-space-after-attr)`" "ng-app" nil nil nil nil nil nil)
                       ("ng" "ng-bind-html-unsafe=\"$0\"`\n(ng-snip/docs \"ng-bind-html-unsafe\")\n(ng-snip/maybe-space-after-attr)`" "ng-bind-html-unsafe" nil nil nil nil nil nil)
                       ("ng" "ng-bind-template=\"$0\"`\n(ng-snip/docs \"ng-bind-template\")\n(ng-snip/maybe-space-after-attr)`" "ng-bind-template" nil nil nil nil nil nil)
                       ("ng" "ng-bind=\"$0\"`\n(ng-snip/docs \"ng-bind\")\n(ng-snip/maybe-space-after-attr)`" "ng-bind" nil nil nil nil nil nil)
                       ("ng" "ng-change=\"$0\"`\n(ng-snip/docs \"ng-change\")\n(ng-snip/maybe-space-after-attr)`" "ng-change" nil nil nil nil nil nil)
                       ("ng" "ng-checked=\"$0\"`\n(ng-snip/docs \"ng-checked\")\n(ng-snip/maybe-space-after-attr)`" "ng-checked" nil nil nil nil nil nil)
                       ("ng" "ng-class-even=\"$0\"`\n(ng-snip/docs \"ng-class-even\")\n(ng-snip/maybe-space-after-attr)`" "ng-class-even" nil nil nil nil nil nil)
                       ("ng" "ng-class-odd=\"$0\"`\n(ng-snip/docs \"ng-class-odd\")\n(ng-snip/maybe-space-after-attr)`" "ng-class-odd" nil nil nil nil nil nil)
                       ("ng" "ng-class=\"{'${1:class}': ${2:condition}$0}\"`\n(ng-snip/docs \"ng-class\")\n(ng-snip/maybe-space-after-attr)`" "ng-class" nil nil nil nil nil nil)
                       ("ng" "ng-click=\"$0\"`\n(ng-snip/docs \"ng-click\")\n(ng-snip/maybe-space-after-attr)`" "ng-click" nil nil nil nil nil nil)
                       ("ng" "ng-cloak`\n(ng-snip/docs \"ng-cloak\")\n(ng-snip/maybe-space-after-attr)`" "ng-cloak" nil nil nil nil nil nil)
                       ("ng" "ng-controller=\"$0\"`\n(ng-snip/docs \"ng-controller\")\n(ng-snip/maybe-space-after-attr)`" "ng-controller" nil nil nil nil nil nil)
                       ("ng" "ng-csp`\n(ng-snip/docs \"ng-csp\")\n(ng-snip/maybe-space-after-attr)`" "ng-csp" nil nil nil nil nil nil)
                       ("ng" "ng-dblclick=\"$0\"`\n(ng-snip/docs \"ng-dblclick\")\n(ng-snip/maybe-space-after-attr)`" "ng-dblclick" nil nil nil nil nil nil)
                       ("ng" "ng-disabled=\"$0\"`\n(ng-snip/docs \"ng-disabled\")\n(ng-snip/maybe-space-after-attr)`" "ng-disabled" nil nil nil nil nil nil)
                       ("ng" "ng-form`\n(ng-snip/docs \"ng-form\")\n(ng-snip/maybe-space-after-attr)`" "ng-form" nil nil nil nil nil nil)
                       ("ng" "ng-hide=\"$0\"`\n(ng-snip/docs \"ng-hide\")\n(ng-snip/maybe-space-after-attr)`" "ng-hide" nil nil nil nil nil nil)
                       ("ng" "ng-href=\"$0\"`\n(ng-snip/docs \"ng-href\")\n(ng-snip/maybe-space-after-attr)`" "ng-href" nil nil nil nil nil nil)
                       ("ng" "ng-include=\"'$0'\"`\n(ng-snip/docs \"ng-include\")\n(ng-snip/maybe-space-after-attr)`" "ng-include" nil nil nil nil nil nil)
                       ("ng" "ng-init=\"$0\"`\n(ng-snip/docs \"ng-init\")\n(ng-snip/maybe-space-after-attr)`" "ng-init" nil nil nil nil nil nil)
                       ("ng" "ng-list`\n(ng-snip/docs \"ng-list\")\n(ng-snip/maybe-space-after-attr)`" "ng-list" nil nil nil nil nil nil)
                       ("ng" "ng-model=\"$0\"`\n(ng-snip/docs \"ng-model\")\n(ng-snip/maybe-space-after-attr)`" "ng-model" nil nil nil nil nil nil)
                       ("ng" "ng-mousedown=\"$0\"`\n(ng-snip/docs \"ng-mousedown\")\n(ng-snip/maybe-space-after-attr)`" "ng-mousedown" nil nil nil nil nil nil)
                       ("ng" "ng-mouseenter=\"$0\"`\n(ng-snip/docs \"ng-mouseenter\")\n(ng-snip/maybe-space-after-attr)`" "ng-mouseenter" nil nil nil nil nil nil)
                       ("ng" "ng-mouseleave=\"$0\"`\n(ng-snip/docs \"ng-mouseleave\")\n(ng-snip/maybe-space-after-attr)`" "ng-mouseleave" nil nil nil nil nil nil)
                       ("ng" "ng-mousemove=\"$0\"`\n(ng-snip/docs \"ng-mousemove\")\n(ng-snip/maybe-space-after-attr)`" "ng-mousemove" nil nil nil nil nil nil)
                       ("ng" "ng-mouseover=\"$0\"`\n(ng-snip/docs \"ng-mouseover\")\n(ng-snip/maybe-space-after-attr)`" "ng-mouseover" nil nil nil nil nil nil)
                       ("ng" "ng-mouseup=\"$0\"`\n(ng-snip/docs \"ng-mouseup\")\n(ng-snip/maybe-space-after-attr)`" "ng-mouseup" nil nil nil nil nil nil)
                       ("ng" "ng-multiple=\"$0\"`\n(ng-snip/docs \"ng-multiple\")\n(ng-snip/maybe-space-after-attr)`" "ng-multiple" nil nil nil nil nil nil)
                       ("ng" "ng-non-bindable=\"$0\"`\n(ng-snip/docs \"ng-non-bindable\")\n(ng-snip/maybe-space-after-attr)`" "ng-non-bindable" nil nil nil nil nil nil)
                       ("ng" "ng-options=\"${1:${2:item}.${3:value} as $2.${4:label} for $2 in ${5:$2s}}\"`\n(ng-snip/docs \"ng-options\")\n(ng-snip/maybe-space-after-attr)`" "ng-options" nil nil nil nil nil nil)
                       ("ng" "ng-pluralize count=\"${1:model}\" when=\"{\n  '0': '${2:none}',\n  'one': '${3:one}',\n  'other': '{} $0'\n}\"`\n(ng-snip/docs \"ng-pluralize\")\n(ng-snip/maybe-space-after-attr)`" "ng-pluralize" nil nil nil nil nil nil)
                       ("ng" "ng-readonly`\n(ng-snip/docs \"ng-readonly\")\n(ng-snip/maybe-space-after-attr)`" "ng-readonly" nil nil nil nil nil nil)
                       ("ng" "ng-repeat=\"${1:thing} in ${2:$1s}\"`\n(ng-snip/docs \"ng-repeat\")\n(ng-snip/maybe-space-after-attr)`" "ng-repeat" nil nil nil nil nil nil)
                       ("ng" "ng-selected=\"$0\"`\n(ng-snip/docs \"ng-selected\")\n(ng-snip/maybe-space-after-attr)`" "ng-selected" nil nil nil nil nil nil)
                       ("ng" "ng-show=\"$0\"`\n(ng-snip/docs \"ng-show\")\n(ng-snip/maybe-space-after-attr)`" "ng-show" nil nil nil nil nil nil)
                       ("ng" "ng-src=\"$0\"`\n(ng-snip/docs \"ng-src\")\n(ng-snip/maybe-space-after-attr)`" "ng-src" nil nil nil nil nil nil)
                       ("ng" "ng-style=\"$0\"`\n(ng-snip/docs \"ng-style\")\n(ng-snip/maybe-space-after-attr)`" "ng-style" nil nil nil nil nil nil)
                       ("ng" "ng-submit=\"$0\"`\n(ng-snip/docs \"ng-submit\")\n(ng-snip/maybe-space-after-attr)`" "ng-submit" nil nil nil nil nil nil)
                       ("ng" "ng-switch=\"$0\"`\n(ng-snip/docs \"ng-switch\")\n(ng-snip/maybe-space-after-attr)`" "ng-switch" nil nil nil nil nil nil)
                       ("ng" "ng-transclude`\n(ng-snip/docs \"ng-transclude\")\n(ng-snip/maybe-space-after-attr)`" "ng-transclude" nil nil nil nil nil nil)
                       ("ng" "ng-view`\n(ng-snip/docs \"ng-view\")\n(ng-snip/maybe-space-after-attr)`" "ng-view" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Tue May 28 07:33:46 2013