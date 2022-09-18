//
//  HomeViewModel.swift
//  Mobilium
//
//  Created by GÜRHAN YUVARLAK on 16.09.2022.
//

import Foundation
import UIKit

final class HomeViewModel {
    
    private var nowPlaying = [NowPlayingResults]()
    private var upcoming = [UpcomingResults]()
    private var upcomingPage = 1
    private var nowPlayingPage = 1
    
    public func getNowPlayingMovies(_ collectionView: UICollectionView, pageControl: UIPageControl){
        Webservice.shared.getNowPlayingMovies(page: nowPlayingPage) { response in
            switch response {
                case .success(let nowPlaying):
                    DispatchQueue.main.async {
                        self.nowPlaying.append(contentsOf: nowPlaying.results ?? [])
                        pageControl.numberOfPages = self.nowPlaying.count
                        collectionView.reloadData()
                    }
                case .failure(_):
                    break;
            }
        }
    }
    
    public func getUpcomingMovies(_ tableView: UITableView){
        Webservice.shared.getUpcomingMovies(page: upcomingPage) { response in
            switch response {
                case .success(let upcoming):
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    tableView.refreshControl?.endRefreshing()
                }
                    DispatchQueue.main.async {
                        self.upcoming.append(contentsOf: upcoming.results ?? [])
                        tableView.reloadData()
                    }
                case .failure(_):
                    break;
            }
        }
    }
    
    public func numberOfItemsInSection() -> Int {
        return nowPlaying.count
    }
    
    public func numberOfRowsInSection() -> Int {
        return upcoming.count
    }
    
    public func tableViewCell(indexPath: IndexPath) -> UpcomingResults{
        return upcoming[indexPath.row]
    }
    
    public func collectionViewCell(with indexPath: IndexPath) -> NowPlayingResults{
        return nowPlaying[indexPath.row]
    }
    
    public func getNowPlayingId(with indexPath: IndexPath) -> Int {
        return nowPlaying[indexPath.row].id ?? 0
    }
    
    public func getUpcomingId(with indexPath: IndexPath) -> Int {
        return upcoming[indexPath.row].id ?? 0
    }
    
    public func increaseUpcomingPage() {
        self.upcomingPage += 1
    }
    
    public func increaseNowPlayingPage() {
        self.nowPlayingPage += 1
    }
    
    public func paginationNowPlaying(_ collectionView: UICollectionView,indexPath: IndexPath, pageControl: UIPageControl) {
        if indexPath.row == nowPlaying.count - 1 {
            increaseNowPlayingPage()
            getNowPlayingMovies(collectionView, pageControl: pageControl)
        }
    }
    
    public func paginationUpComing(_ tableView: UITableView,indexPath: IndexPath) {
        if indexPath.row == upcoming.count - 1 {
            increaseUpcomingPage()
            getUpcomingMovies(tableView)
        }
    }
    
    public func currentPage(pageControl: UIPageControl, indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
}
