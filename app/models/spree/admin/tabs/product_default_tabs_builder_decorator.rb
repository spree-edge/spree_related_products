module Spree
  module Admin
    module Tabs
      module ProductDefaultTabsBuilderDecorator
        def build
          root = super

          add_related_products_tab(root)
          root
        end

        private

        def add_related_products_tab(root)
          tab =
            TabBuilder.new('related_products', ->(resource) { related_admin_product_path(resource) }).
            with_icon_key('resize-small').
            with_active_check.
            with_admin_ability_check(::Spree::Relation).
            build

          root.add(tab)
        end
      end
    end
  end
end
::Spree::Admin::Tabs::ProductDefaultTabsBuilder.prepend(
  Spree::Admin::Tabs::ProductDefaultTabsBuilderDecorator
)
