import 'package:planandact/features/plan_management/domain/entities/plan.dart';

class MotivationOutput {
  const MotivationOutput({
    required this.quote,
    required this.author,
    required this.whyThisQuote,
    required this.microAction,
    required this.smallestStartStep,
    required this.historicalPerson,
    required this.historicalContext,
  });

  final String quote;
  final String author;
  final String whyThisQuote;
  final String microAction;
  final String smallestStartStep;
  final String historicalPerson;
  final String historicalContext;
}

class WisdomService {
  static MotivationOutput generateForToday(List<Plan> plans) {
    final pendingPlans = plans.where((p) => p.status == PlanStatus.pending).toList();

    final hasDeepWork = pendingPlans.any((p) => p.category == PlanCategory.deepWork);
    final hasHealth = pendingPlans.any((p) => p.category == PlanCategory.health);
    final hasPostponed = plans.any((p) => p.postponeCount >= 2);

    if (hasPostponed) {
      return const MotivationOutput(
        quote: 'Discipline is choosing between what you want now and what you want most.',
        author: 'Abraham Lincoln’a atfedilir',
        whyThisQuote: 'Son günlerde ertelenen işlerin arttığını görüyoruz; odak ve disiplin vurgusu bugün kritik.',
        microAction: 'İlk 15 dakikayı bildirimler kapalı şekilde tek bir göreve ayır.',
        smallestStartStep: 'Sadece ilk görevin giriş cümlesini aç ve 3 satır yaz.',
        historicalPerson: 'Marcus Aurelius',
        historicalContext: 'Stoacı yaklaşım: Duygu yerine eylem ritmi kurmak, tutarlılığı artırır.',
      );
    }

    if (hasDeepWork) {
      return const MotivationOutput(
        quote: 'What gets scheduled gets done.',
        author: 'Michael Hyatt',
        whyThisQuote: 'Bugünkü planında yoğun odak gerektiren işler var; takvim disiplini performansı yükseltir.',
        microAction: 'Telefonu farklı bir odaya koy ve 25 dakikalık tek bir odak bloğu başlat.',
        smallestStartStep: 'En zor görevin yalnızca ilk alt başlığını yaz.',
        historicalPerson: 'Cal Newport',
        historicalContext: 'Deep work yaklaşımı, parçalanmış dikkati azaltıp yüksek kaliteli çıktı üretmeyi hedefler.',
      );
    }

    if (hasHealth) {
      return const MotivationOutput(
        quote: 'Take care of your body. It’s the only place you have to live.',
        author: 'Jim Rohn',
        whyThisQuote: 'Planında enerji yönetimiyle ilgili hedefler var; fiziksel ritim tüm gün üretkenliğini etkiler.',
        microAction: '10 dakikalık tempolu yürüyüş ekle ve su içmeyi hatırlatıcıya bağla.',
        smallestStartStep: 'Spor kıyafetini hazırla ve sadece 5 dakikalık hareketle başla.',
        historicalPerson: 'Atatürk',
        historicalContext: '“Sağlam kafa sağlam vücutta bulunur” yaklaşımı, zihinsel performansın temelini vurgular.',
      );
    }

    return const MotivationOutput(
      quote: 'Small disciplines repeated with consistency every day lead to great achievements.',
      author: 'John C. Maxwell',
      whyThisQuote: 'Bugünkü plan dengeli görünüyor; sürdürülebilirlik için küçük ama net adımlar en iyi strateji.',
      microAction: 'Günün ilk görevini 10 dakika erken başlat.',
      smallestStartStep: 'Sadece ilk görevin dosyasını aç ve bir cümle ekle.',
      historicalPerson: 'James Clear',
      historicalContext: 'Atomic habits yaklaşımı, çok küçük başlangıçların zincir etkisiyle büyümesini savunur.',
    );
  }
}
