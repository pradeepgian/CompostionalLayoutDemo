//
//  ManagerDashboardViewController.swift
//  CompostionalLayoutDemo
//
//  Created by Pradeep Gianchandani on 09/09/21.
//

import UIKit

class ManagerDashboardViewController: UIViewController {
    
    override func viewDidLoad() {
        self.navigationItem.title = "Manager Dashboard"
        setupCollectionView()
        setupDiffableDatasource()
    }
    
    private func setupCollectionView() {
        self.view.addSubview(collectionView)
        collectionView.fillSuperview()
        self.collectionView.backgroundColor = .customLightBackgroundColor
        collectionView.collectionViewLayout = configureLayout()
        collectionView.register(DashboardHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DashboardHeaderView.identifier)
        collectionView.register(DashboardFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: DashboardFooterView.identifier)
        collectionView.register(DashboardCategoryCell.self, forCellWithReuseIdentifier: DashboardCategoryCell.cellIdentifier)
        collectionView.register(PersonCell.self, forCellWithReuseIdentifier: PersonCell.cellIdentifier)
        collectionView.register(SummaryCell.self, forCellWithReuseIdentifier: SummaryCell.cellIdentifier)
        collectionView.register(AssessmentCell.self, forCellWithReuseIdentifier: AssessmentCell.cellIdentifier)
        
    }
    
    private func configureLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, _) -> NSCollectionLayoutSection? in
            let section = DashboardSection.allCases[sectionNumber]
            switch section {
                case .categories:
                    return self.getCategoriesSectionLayout()
                case .persons:
                    return self.getPersonsSectionLayout()
                case .summary:
                    return self.getSummarySectionLayout()
                case .assessment:
                    return self.getAssessmentSectionLayout()
            }
        }
        layout.register(BackgroundDecorationView.self, forDecorationViewOfKind: BackgroundDecorationView.identifier)
        return layout
    }
    
    private func getCategoriesSectionLayout() -> NSCollectionLayoutSection {
        
        // Here we create a group which is 50 points in width and 60 points in height
        // Item added within the group is 50 points in width and fills 100% of height within the group
        
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(50), heightDimension: .fractionalHeight(1.0)))

        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .estimated(50), heightDimension: .absolute(60)),
                                                     subitem: item,
                                                     count: 1)
        group.contentInsets = .init(top: 10, leading: 0, bottom: 10, trailing: 0)

        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 16
        section.contentInsets.trailing = 16
        section.interGroupSpacing = 10
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
    private func getPersonsSectionLayout() -> NSCollectionLayoutSection {
        
        // Here we create a group which is (1/3.5) of screen width and 150 points in height
        // Item added within the group is fills 100% of width and height within the group
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 10, leading: 0, bottom: 10, trailing: 16)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1/3.5), heightDimension: .absolute(150)),
                                                     subitems: [item])
         
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets.leading = 16
        
        let footerKind = UICollectionView.elementKindSectionFooter
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(0.5)),
                  elementKind: footerKind,
                  alignment: .bottom)
        ]
        
        // This is to provide a white background to specific section
        section.decorationItems = [
            NSCollectionLayoutDecorationItem.background(elementKind: BackgroundDecorationView.identifier)
        ]
        
        return section
    }
    
    private func getSummarySectionLayout() -> NSCollectionLayoutSection {
        
        // Here we create group which occupies 100% of screen width
        // Items added to group will occupy and 50% of group width and items will be added horizontally
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 8, leading: 0, bottom: 8, trailing: 16)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100)),
                                                       subitems: [item])
         
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 16
        
        let kind = UICollectionView.elementKindSectionHeader
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30)),
                  elementKind: kind,
                  alignment: .topLeading)
        ]
        section.decorationItems = [
           NSCollectionLayoutDecorationItem.background(elementKind: BackgroundDecorationView.identifier)
        ]
        
        return section
    }
    
    private func getAssessmentSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 0, leading: 0, bottom: 16, trailing: 16)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(210)),
                                                       subitems: [item])
         
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 16
        section.contentInsets.top = 20
        section.contentInsets.bottom = 30
        return section
    }
    
    lazy private var diffableDataSource: UICollectionViewDiffableDataSource<DashboardSection, AnyHashable> = .init(collectionView: self.collectionView) { (collectionView, indexPath, object) -> UICollectionViewCell? in
        
        if let object = object as? Category {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardCategoryCell.cellIdentifier, for: indexPath) as! DashboardCategoryCell
            cell.category = object
            return cell
        } else if let object = object as? Person {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonCell.cellIdentifier, for: indexPath) as! PersonCell
            cell.person = object
            return cell
        } else if let object = object as? Activity {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SummaryCell.cellIdentifier, for: indexPath) as! SummaryCell
            cell.activity = object
            return cell
        } else if let object = object as? Assessment {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AssessmentCell.cellIdentifier, for: indexPath) as! AssessmentCell
            cell.assessment = object
            return cell
        }
        
        return nil
    }
    
    private func setupDiffableDatasource() {
        diffableDataSource.supplementaryViewProvider = .some({ (collectionView, kind, indexPath) -> UICollectionReusableView? in
            switch kind {
                case UICollectionView.elementKindSectionHeader:
                    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DashboardHeaderView.identifier, for: indexPath) as! DashboardHeaderView
                    
                    let snapshot = self.diffableDataSource.snapshot()
                    if let object = self.diffableDataSource.itemIdentifier(for: indexPath) {
                        if let section = snapshot.sectionIdentifier(containingItem: object) {
                            if section == .summary {
                                headerView.sectionHeaderLabel.text = self.dashboardVM.summaryData?.title
                                headerView.viewAllLabel.isHidden = true
                            } else {
                                headerView.sectionHeaderLabel.isHidden = true
                            }
                        }
                    }
                    return headerView
                case UICollectionView.elementKindSectionFooter:
                    let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DashboardFooterView.identifier, for: indexPath) as! DashboardFooterView
                    return footerView
                default:
                    fatalError("Unexpected element kind")
            }
        })
        
        var snapshot = self.diffableDataSource.snapshot()
        snapshot.appendSections([.categories, .persons, .summary, .assessment])
        snapshot.appendItems(dashboardVM.categories, toSection: .categories)
        snapshot.appendItems(dashboardVM.persons, toSection: .persons)
        snapshot.appendItems(dashboardVM.summaryData?.activities ?? [], toSection: .summary)
        snapshot.appendItems(dashboardVM.assessments, toSection: .assessment)
        self.diffableDataSource.apply(snapshot)
    }
    
    private let dashboardVM = DashboardViewModel()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureLayout())
    
    override func viewDidAppear(_ animated: Bool) {
        // Pre-select first category
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .left)
    }
    
}

