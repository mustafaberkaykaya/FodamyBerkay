//
//  DataProvider.swift
//  FodamyBerkay
//
//  Created by Mustafa Berkay Kaya on 16.03.2022.
//

#if DEBUG
let apiDataProvider = ApiDataProvider(interceptor: APIRequestInterceptor.shared,
                                      eventMonitors: [APILogger.shared])
#else
let apiDataProvider = ApiDataProvider(interceptor: APIRequestInterceptor.shared,
                                      eventMonitors: [])
#endif
