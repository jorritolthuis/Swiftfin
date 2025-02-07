//
/*
 * SwiftFin is subject to the terms of the Mozilla Public
 * License, v2.0. If a copy of the MPL was not distributed with this
 * file, you can obtain one at https://mozilla.org/MPL/2.0/.
 *
 * Copyright 2021 Aiden Vigue & Jellyfin Contributors
 */

import Defaults
import Foundation
import JellyfinAPI
import Stinsen
import SwiftUI

final class VideoPlayerCoordinator: NavigationCoordinatable {

    let stack = NavigationStack(initial: \VideoPlayerCoordinator.start)

    @Root var start = makeStart

    let viewModel: VideoPlayerViewModel

    init(viewModel: VideoPlayerViewModel) {
        self.viewModel = viewModel
    }

    @ViewBuilder func makeStart() -> some View {
        PreferenceUIHostingControllerView {
            VLCPlayerView(viewModel: self.viewModel)
                .navigationBarHidden(true)
                .statusBar(hidden: true)
                .ignoresSafeArea()
                .prefersHomeIndicatorAutoHidden(true)
                .supportedOrientations(UIDevice.current.userInterfaceIdiom == .pad ? .all : .landscape)
        }.ignoresSafeArea()
    }
}
