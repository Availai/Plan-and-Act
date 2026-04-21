enum PlanLane {
  critical,
  mustDo,
  challenging,
  choreUseful;

  String get id {
    switch (this) {
      case PlanLane.critical:
        return 'critical';
      case PlanLane.mustDo:
        return 'must_do';
      case PlanLane.challenging:
        return 'challenging';
      case PlanLane.choreUseful:
        return 'chore_useful';
    }
  }

  String get labelTr {
    switch (this) {
      case PlanLane.critical:
        return 'Kritik';
      case PlanLane.mustDo:
        return 'Yapılmalı';
      case PlanLane.challenging:
        return 'Zorlayıcı';
      case PlanLane.choreUseful:
        return 'Angarya ama Yararlı';
    }
  }

  static PlanLane fromCategoryId(String? categoryId) {
    switch (categoryId) {
      case 'critical':
        return PlanLane.critical;
      case 'must_do':
        return PlanLane.mustDo;
      case 'challenging':
        return PlanLane.challenging;
      case 'chore_useful':
        return PlanLane.choreUseful;
      default:
        return PlanLane.mustDo;
    }
  }
}
