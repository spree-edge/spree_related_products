module Spree
  module Admin
    module MainMenu
      module DefaultConfigurationBuilderDecorator
        def add_products_section(root)
          super

          section = root.items.find { |s| s.key == 'products' }
          return unless section

          section.items << ItemBuilder.new('relation_types', admin_relation_types_path).
            with_manage_ability_check(Spree::RelationType).
            with_match_path('/relation_types').
            build
        end
      end
    end
  end
end

::Spree::Admin::MainMenu::DefaultConfigurationBuilder.prepend(
  Spree::Admin::MainMenu::DefaultConfigurationBuilderDecorator
)
