# frozen_string_literal: true

class EvqlidResult < ApplicationRecord
  validates :num1, uniqueness: { scope: :num2 }
  validates :num1, :num2, :nod, :nok, presence: true
  validate :unique_pair, on: :create

  has_many :evqlid_iteration

  def unique_pair
    errors.add(:already_calculated, 'посчитано') unless
    EvqlidResult.find_by(num1: num2, num2: num1).nil?
  end

  def self.get_json(num1, num2)
    go_to_json(*self.get(num1, num2))
  end

  def self.get(num1, num2)
    result = find_by(num1: num1, num2: num2)
    result = find_by(num1: num2, num2: num1) if result.blank?
    return [result.evqlid_iterations.all.order(:step), result.nod, result.nok] unless result.blank?

    generate_result(num1, num2)
  end

  def to_xml
    Nokogiri::XML::Builder.new do |xml|
      xml.result do
        xml.id id
        xml.nod nod
        xml.nok nok
        xml.iterations do
          evqlid_iterations.all.each do |iter|
            xml.iter do
              xml.id iter.index
              xml.num1 iter.num1
              xml.num2 iter.num2
            end
          end
        end
      end
    end.doc.root.to_xml
  end

  private

  def self.generate_result(num1, num2)
    iterations, nod, nok = calculating(num1, num2)

    res = create(num1: num2, num2: num2, nod: nod, nok: nok)

    iter_objects = iterations.reduce([]) do |sum, iteration|
      iter_res, index = iteration
      sum.push(EvqlidIteration.create(evqlid_result_id: res.id, iteration: index,
                                      num1: iter_res[0], num2: iter_res[1]))
    end

    [iter_objects, nod, nok]
  end

  def self.calculating(num1, num2)
    results = calc_nod(num1, num2)
              .each_with_index
              .take_while { |res, _| [res[0], res[1]].min != 0 }

    nod = results.blank? ? num1 : results[-1][0].max
    nok = num1 * num2 / nod

    [results, nod, nok]
  end

  def self.calc_nod(mres, nres)
    iter = 0
    Enumerator.new do |yielder|
      loop do
        yielder << if mres < nres
                     [iter += 1, mres, nres -= mres]
                   else
                     [iter += 1, mres -= nres, nres]
                   end
      end
    end
    # @k_k = [mres, nres].max
  end

  def calc_sum
    params[:num1].to_i * params[:num2].to_i / @k_k
  end

  def self.go_to_json(res_iterations, nod, nok)
    ActiveSupport::JSON.encode({
                                 iteration: res_iterations,
                                 nod: nod,
                                 nok: nok
                               })
  end

  private_class_method :generate_result, :calculating,
                       :calc_nod, :go_to_json
end
