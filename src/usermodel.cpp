#include "usermodel.hpp"

UserModel::UserModel(QObject* parent) : QAbstractItemModel(parent) {}

QVariant UserModel::headerData(int section,
                               Qt::Orientation orientation,
                               int role) const {
  // FIXME: Implement me!
  QVariant var;

  return var;
}

QModelIndex UserModel::index(int row,
                             int column,
                             const QModelIndex& parent) const {
  // FIXME: Implement me!
  QModelIndex i;

  return i;
}

QModelIndex UserModel::parent(const QModelIndex& index) const {
  // FIXME: Implement me!
  QModelIndex i;

  return i;
}

int UserModel::rowCount(const QModelIndex& parent) const {
  if (!parent.isValid())
    return 0;

  // FIXME: Implement me!
  return 1;
}

int UserModel::columnCount(const QModelIndex& parent) const {
  if (!parent.isValid())
    return 0;

  // FIXME: Implement me!
  return 1;
}

QVariant UserModel::data(const QModelIndex& index, int role) const {
  if (!index.isValid())
    return QVariant();

  // FIXME: Implement me!
  return QVariant();
}
