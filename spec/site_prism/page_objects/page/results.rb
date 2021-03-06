module PageObjects
  module Page
    class Results < SitePrism::Page
      set_url "/results"
      class CookieBannerSection < SitePrism::Section
        element :cookies_info_link, '[data-qa="cookie-banner__info-link"]'
        element :accept_all_cookies, '[data-qa="cookie-banner__accept"]'
        element :set_preference_link, '[data-qa="cookie-banner__preference-link"]'
      end

      class CourseSection < SitePrism::Section
        element :provider_name, '[data-qa="course__provider_name"]'
        element :description, '[data-qa="course__description"]'
        element :name, '[data-qa="course__name"]'
        element :accrediting_provider, '[data-qa="course__accrediting_provider"]'
        element :funding_options, '[data-qa="course__funding_options"]'
        element :main_address, '[data-qa="course__main_address"]'
        elements :show_vacanices, '[data-qa="course__has_vacancies"]'
      end

      class SubjectsSection < SitePrism::Section
        element :send_courses, '[data-qa="send_courses"]'
        elements :subjects, '[data-qa="subjects"]'
        element :extra_subjects, '[data-qa="extra_subjects"]'
        element :link, '[data-qa="link"]'
      end

      class StudyTypeSection < SitePrism::Section
        element :subheading, "h2"
        element :fulltime, '[data-qa="fulltime"]'
        element :parttime, '[data-qa="parttime"]'
        element :link, '[data-qa="link"]'
      end

      class VacanciesSection < SitePrism::Section
        element :subheading, "h2"
        element :vacancies, '[data-qa="vacancies"]'
        element :link, '[data-qa="link"]'
      end

      class QualificationsSection < SitePrism::Section
        elements :qualifications, '[data-qa="qualifications"]'
        element :link, '[data-qa="link"]'
        element :qts_only, '[data-qa="qts_only"]'
        element :pgde_pgce_with_qts, '[data-qa="pgde_pgce_with_qts"]'
        element :other_qualifications, '[data-qa="other_qualifications"]'
      end

      class LocationSection < SitePrism::Section
        element :name, '[data-qa="location_name"]'
        element :distance, '[data-qa="distance"]'
        element :map, '[data-qa="map"]'
        element :link, '[data-qa="link"]'
      end

      class ProviderSection < SitePrism::Section
        element :name, '[data-qa="provider_name"]'
        element :link, '[data-qa="link"]'
      end

      class FundingSection < SitePrism::Section
        element :funding, '[data-qa="funding"]'
        element :with_or_without_salary, '[data-qa="with-or-without-salary"]'
        element :with_salary, '[data-qa="with-salary"]'
        element :link, '[data-qa="link"]'
      end

      class SortFormSection < SitePrism::Section
        section :options, '[data-qa="sort-form__options"]' do
          element :ascending, '[data-qa="sort-form__options__ascending"]'
          element :descending, '[data-qa="sort-form__options__descending"]'
          element :distance, '[data-qa="sort-form__options__distance"]'
        end
        element :submit, '[data-qa="sort-form__submit"]'
      end

      class SuggestedSearchLinkSection < SitePrism::Section
        element :link, '[data-qa="link"]'
      end

      section :cookie_banner, CookieBannerSection, '[data-qa="cookie-banner"]'
      sections :courses, CourseSection, '[data-qa="course"]'
      section :subjects_filter, SubjectsSection, '[data-qa="filters__subjects"]'
      section :study_type_filter, StudyTypeSection, '[data-qa="filters__studytype"]'
      section :qualifications_filter, QualificationsSection, '[data-qa="filters__qualifications"]'
      section :vacancies_filter, VacanciesSection, '[data-qa="filters__vacancies"]'
      section :funding_filter, FundingSection, '[data-qa="filters__funding"]'
      section :location_filter, LocationSection, '[data-qa="filters__location"]'
      section :provider_filter, ProviderSection, '[data-qa="filters__provider"]'

      element :heading, '[data-qa="heading"]'
      element :next_button, '[data-qa="next_button"]'
      element :previous_button, '[data-qa="previous_button"]'
      element :course_count, '[data-qa="course-count"]'
      element :location_link, '[data-qa="filters__location_link"]'
      element :subject_link, '[data-qa="filters__subject"]'
      element :qualification_link, '[data-qa="filters__qualification_link"]'
      element :salary_link, '[data-qa="filters__salary_link"]'
      element :vacancies_link, '[data-qa="filters__vacancies_link"]'

      element :suggested_searches, '[data-qa="suggested_searches"]'
      element :suggested_search_heading, '[data-qa="suggested_search_heading"]'
      element :suggested_search_description, '[data-qa="suggested_search_description"]'
      sections :suggested_search_links, SuggestedSearchLinkSection, '[data-qa="suggested_search_link"]'

      section :sort_form, SortFormSection, '[data-qa="sort-form"]'

      element :sorted_by_distance, ".search-results-header", text: "Sorted by distance"
    end
  end
end
